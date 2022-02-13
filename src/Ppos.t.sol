// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.10;

import 'ds-test/test.sol';
import '@openzeppelin'
import './PPoS.sol';

contract PPoSTest is DSTest {
	PPoS ppos;

	function setUp() public {
		ppos = new PPoS();
	}

	function testFail_basic_sanity() public {
		assertTrue(false);
	}

	function test_basic_sanity() public {
		assertTrue(true);
	}

	function sendOrder() {

	}

	function testTransferSomething() public {
		// We call `.balanceOf()` on the  contract 
		uint256 senderBalance = ERC20().balanceOf(sender) 
		uint256 recipientBalance = ERC20().balanceOf(recipient)

		assert
	}
}
