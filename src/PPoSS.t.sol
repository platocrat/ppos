// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.11;

import 'ds-test/test.sol';

import './PPoSS.sol';

contract PPoSSTest is DSTest {
	PpoSS pposs;

	function setUp() public {
		pposs = new PpoSS();
	}

	function testFail_basic_sanity() public {
		assertTrue(false);
	}

	function test_basic_sanity() public {
		assertTrue(true);
	}
}
