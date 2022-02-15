// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.10;

import "../libraries/SgMenu__Spring2022.sol";
import "../../libraries/OrderManager.sol"; // part of PPoS
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Sweetgreen's point-of-sale (PoS) contract
contract Sweetgreen {
    using OrderManager for SgMenu__Spring2022.Order;

    SgMenu__Spring2022.Order om;

    /**
     * @dev Emitted when an order is made.
     */
    event Order__Added(
        address indexed address_,
        uint256 indexed timestamp,
        uint256 cost,
        SgMenu__Spring2022.Order order
    );

    mapping(address => SgMenu__Spring2022.Patron) patrons;

    // Enum and Struct (CreateYourOwn) arrays
    SgMenu__Spring2022.WarmBowl[] warmBowls; // `WarmBowl` enum array
    SgMenu__Spring2022.Salad[] salads;
    SgMenu__Spring2022.CreateYourOwn[] createYourOwn;
    SgMenu__Spring2022.Side[] sides;
    SgMenu__Spring2022.Beverage[] beverages;
    SgMenu__Spring2022.DietaryRestriction[] dietaryRestrictions;

    /**
     * @dev Creates 1 order from user's selections on the UI.
     *
     * @notice This function must ONLY be called if the `hasDuplicates()` (see
     *         the `ui` directory for more info) function, which is defined on
     *         the frontend, returns `true`.
     *
     * @param _patron Address that is making the order.
     * @param cost This value is returned and passed to `createOrder()` by a
     *             frontend function. It is the total cost of the order.
     * @param _wbs Warmbowls that the patron has added to their order.
     * @param _feats Featured items that the patron has added to their order.
     * @param _salads Salads that the patron has added to their order.
     * @param _cyos Create-Your-Own bowls that patron has added to their order.
     * @param _sides Sides that the patron has added to their order.
     * @param _bevs Beverages that the patron has added to their order.
     * @param _drs Dietary restrictions that patron has added to their order.
     * @return order_
     */
    function createOrder(
        address _patron,
        uint256 cost,
        SgMenu__Spring2022.WarmBowl[] memory _wbs,
        SgMenu__Spring2022.Featured[] memory _feats,
        SgMenu__Spring2022.Salad[] memory _salads,
        SgMenu__Spring2022.CreateYourOwn[] memory _cyos,
        SgMenu__Spring2022.Side[] memory _sides,
        SgMenu__Spring2022.Beverage[] memory _bevs,
        SgMenu__Spring2022.DietaryRestriction[] memory _drs
    ) public returns (SgMenu__Spring2022.Order memory order_) {
        require(
            _wbs.length < 5,
            "You tried adding more than the order limit for WarmBowls!"
        );
        require(
            _feats.length < 5,
            "You tried adding more than the order limit for Featured items!"
        );
        require(
            _salads.length < 5,
            "You tried adding more than order order limit for Salads!"
        );
        require(
            _cyos.length < 5,
            "You tried adding more than the order limit for CreateYourOwns!"
        );
        require(
            _sides.length < 5,
            "You tried adding more than the order limit for Sides!"
        );
        require(
            _bevs.length < 5,
            "You tried adding more than the order limit for Sides!"
        );
        require(
            _drs.length < 6,
            "You tried adding more than the order limit for DietaryRestrictions!"
        );

        // We push to `.orders` after setting the order items individually
        patrons[_patron].address_ = _patron;
        patrons[_patron].joined = block.timestamp;

        SgMenu__Spring2022.Order memory order;

        // Procedurally, create bowl to add to patron's `orders`
        // todo: We might need to store whether the array is empty.
        //       The code block below does not initialize these empty arrays.
        if (uint256(_wbs[0]) != 0) order.wbs = _wbs; // 1
        if (uint256(_feats[0]) != 0) order.feats = _feats;
        if (uint256(_salads[0]) != 0) order.salads = _salads;
        if (_cyos.length > 0) order.cyos = _cyos;
        if (uint256(_sides[0]) != 0) order.sides = _sides;
        if (uint256(_bevs[0]) != 0) order.bevs = _bevs;
        if (uint256(_drs[0]) != 0) order.drs = _drs; // 7

        // Add order to patron's order history
        patrons[_patron].orders.push(order);

        emit Order__Added(_patron, block.timestamp, cost, order);

        // todo: Finish this function
        om.sendOrderToOM();

        return order;
    }
}
