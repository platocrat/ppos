// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./libraries/menus/2022/spring/SgMenu__Spring2022.sol";

contract OrderManager {
    address USDC_ADDRESS = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    struct Order {
        bytes32 orderHash;
        uint256 cost;
    }

    struct Vendor {
        address vendorAddress;
        Order[] orders;
    }

    mapping(bytes32 => Order) orders;
    mapping(address => Vendor) vendors;

    function sendPayment(
        bytes32[] calldata _self,
        address _vendor,
        uint256 _amount
    ) external returns (bool success) {
        // address dst; // dst is address of BatchSubmitter;
        // someTransferMethod(_order, dst)

        // GOAL: Get the total USDC amount from a batch of orders
        // 1. Determine interval to determine the batch size
        // 2. Get the list of orders according to the batch size
        // 3. Sum the each order's `cost` to get the total `_amount`

        ERC20(USDC_ADDRESS).transferFrom(address(this), _vendor, _amount);
        return true;
    }

    // todo: 1. Expand on the diagram that you made that shows the routes from
    //          createOrder() --> OM --> sendOrder() --> BS
    //          a.) Is this flow an accurate representation of the flow of
    //              information for a restaurant like Sweetgreen?
    // todo: Finish this function!!
    function sendOrderHash(bytes32 _self, uint256 _cost)
        public
        returns (bool success)
    {
        Order memory order_ = Order(_self, _cost);
        orders[_self] = order_;
        return true;
    }

    // // Function to receive Ether. msg.data must be empty
    // receive() external payable {}

    // // Fallback function is called when msg.data is not empty
    // fallback() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
