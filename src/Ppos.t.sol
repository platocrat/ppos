// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "./Sweetgreen/libraries/SgMenu__Spring2022.sol";
import "./PPoS.sol";

contract PPoSTest is DSTest {
    PPoS ppos;
    address constant USDC_ADDRESS = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    function setUp() public {
        ppos = new PPoS();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }

    function sendOrder() public {}

    function testTransferSomething() public {
        // We call `.balanceOf()` on the  contract
        address sender = msg.sender;
        address recipient = 0x144579C1d14335580A4F7DcF14554099a30074c9;

        uint256 senderBalance = ERC20(USDC_ADDRESS).balanceOf(sender);
        uint256 recipientBalance = ERC20(USDC_ADDRESS).balanceOf(recipient);
    }
}
