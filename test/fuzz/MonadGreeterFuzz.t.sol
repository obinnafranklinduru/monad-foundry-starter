// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { Test } from "forge-std/Test.sol";
import { MonadGreeter } from "../../src/MonadGreeter.sol";

contract MonadGreeterFuzz is Test {
    MonadGreeter public greeter;
    address public owner;

    function setUp() public {
        owner = address(this);
        greeter = new MonadGreeter("Init");
    }

    // Fuzz testing: Forge will run this with thousands of random strings
    function testFuzz_SetGreeting(string calldata newGreeting) public {
        // Assume: We don't want to test empty strings as we know they revert
        vm.assume(bytes(newGreeting).length > 0);

        vm.prank(owner);
        greeter.setGreeting(newGreeting);
        assertEq(greeter.getGreeting(), newGreeting);
    }
}
