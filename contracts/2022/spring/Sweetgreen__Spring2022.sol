// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "../../OrderManager.sol"; // part of PPoS
import "../../libraries/menus/2022/spring/SgMenu__Spring2022.sol";

error MaxQuantityReached(uint256 quantity);
error DuplicateDietaryRestriction(bool hasNoDuplicates);

// Sweetgreen's point-of-sale (PoS) contract
contract Sweetgreen__Spring2022 {
    address USDC_ADDRESS = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address OM_ADDRESS = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48; // address of OrderManager

    /**
     * @dev Emitted when an order is made.
     */
    event OrderConfirmed(
        address indexed address_,
        uint256 indexed timestamp,
        uint256 cost,
        SgMenu__Spring2022.Order order,
        bytes32 orderHash
    );

    event OrderSentToOM(
        address indexed address_,
        uint256 indexed timestamp,
        uint256 cost,
        bytes32 orderHash
    );

    mapping(address => SgMenu__Spring2022.Patron) patrons;
    mapping(bytes32 => SgMenu__Spring2022.Order) orders;

    /**
     * @dev Creates 1 order from user's selections on the UI.
     *
     * @notice This function must ONLY be called if the `hasDuplicates()` (see
     *         the `ui` directory for more info) function, which is defined on
     *         the frontend, returns `true`.
     *
     * @param _patron Address that is making the order.
     * @param _cost This value is returned and passed to `checkout()` by a
     *             frontend function. It is the total cost of the order.
     * @param _wbs Warmbowls that the patron has added to their order.
     * @param _salads Salads that the patron has added to their order.
     * @param _feats Featured items that the patron has added to their order.
     * @param _cyos Create-Your-Own bowls that patron has added to their order.
     * @param _sides Sides that the patron has added to their order.
     * @param _bevs Beverages that the patron has added to their order.
     * @param _drs Dietary restrictions that patron has added to their order.
     * @return order
     */
    function checkout(
        address _patron,
        uint256 _cost,
        SgMenu__Spring2022.WarmBowl[] memory _wbs,
        SgMenu__Spring2022.Salad[] memory _salads,
        SgMenu__Spring2022.Featured[] memory _feats,
        SgMenu__Spring2022.CreateYourOwn[] memory _cyos,
        SgMenu__Spring2022.Side[] memory _sides,
        SgMenu__Spring2022.Beverage[] memory _bevs,
        SgMenu__Spring2022.DietaryRestriction[] memory _drs
    ) public payable returns (SgMenu__Spring2022.Order memory order) {
        if (_wbs.length > 5) revert MaxQuantityReached(_wbs.length);
        if (_salads.length > 5) revert MaxQuantityReached(_salads.length);
        if (_feats.length > 5) revert MaxQuantityReached(_feats.length);
        if (_sides.length > 5) revert MaxQuantityReached(_sides.length);
        if (_bevs.length > 5) revert MaxQuantityReached(_bevs.length);
        if (_drs.length > 6) revert MaxQuantityReached(_drs.length);

        if (SgMenu__Spring2022.hasNoDuplicates(_drs))
            revert DuplicateDietaryRestriction(
                SgMenu__Spring2022.hasNoDuplicates(_drs)
            );

        patrons[_patron].address_ = _patron;
        patrons[_patron].joined = block.timestamp;

        order = SgMenu__Spring2022.Order(
            _wbs,
            _salads,
            _feats,
            _cyos,
            _sides,
            _bevs,
            _drs
        );

        patrons[_patron].orders.push(order);

        bytes32 orderHash = createOrderHash(
            _wbs,
            _salads,
            _feats,
            _cyos,
            _sides,
            _bevs,
            _drs
        );

        orders[orderHash] = order;

        emit OrderConfirmed(_patron, block.timestamp, _cost, order, orderHash);

        OrderManager(OM_ADDRESS).sendOrderHash(orderHash, _cost);

        // Send USDC to `OrderManager` so that it can submit a batched tx of
        //  order amounts at a later time.
        ERC20(USDC_ADDRESS).transferFrom(_patron, OM_ADDRESS, _cost);

        emit OrderSentToOM(_patron, block.timestamp, _cost, orderHash);

        return order;
    }

    /******************
     * Pure functions *
     *****************/
    function createOrderHash(
        SgMenu__Spring2022.WarmBowl[] memory _wbs,
        SgMenu__Spring2022.Salad[] memory _salads,
        SgMenu__Spring2022.Featured[] memory _feats,
        SgMenu__Spring2022.CreateYourOwn[] memory _cyos,
        SgMenu__Spring2022.Side[] memory _sides,
        SgMenu__Spring2022.Beverage[] memory _bevs,
        SgMenu__Spring2022.DietaryRestriction[] memory _drs
    ) internal pure returns (bytes32 orderHash) {
        SgMenu__Spring2022.Base[] memory bases;
        SgMenu__Spring2022.Topping[] memory toppings;
        SgMenu__Spring2022.Premium[] memory premiums;
        SgMenu__Spring2022.Dressing[] memory dressings;

        for (uint256 i = 0; i < _cyos.length; i++) {
            bases = _cyos[i].bases;
            toppings = _cyos[i].toppings;
            premiums = _cyos[i].premiums;
            dressings = _cyos[i].dressings;
        }

        orderHash = keccak256(
            abi.encodePacked(
                _wbs,
                _salads,
                _feats,
                bases,
                toppings,
                premiums,
                dressings,
                _sides,
                _bevs,
                _drs
            )
        );

        return orderHash;
    }

    /******************
     * View functions *
     *****************/
    /**
     * @param orderHash Hash of the `Order` struct's properties
     * @return order `Order` struct for the provided `orderHash`
     */
    function getOrder(bytes32 orderHash)
        public
        view
        returns (SgMenu__Spring2022.Order memory order)
    {
        return orders[orderHash];
    }
}
