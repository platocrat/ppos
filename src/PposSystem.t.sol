// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./PposSystem.sol";

contract PposSystemTest is DSTest {
    PposSystem system;

    function setUp() public {
        system = new PposSystem();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
