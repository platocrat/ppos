// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.10;

import 'ds-test/test.sol';

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
}