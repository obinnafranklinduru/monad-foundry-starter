// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { Test } from "forge-std/Test.sol";
import { MonadGreeter } from "../../src/MonadGreeter.sol";

contract MonadIntegrationTest is Test {
    MonadGreeter public greeter;
    address public owner;

    function setUp() public {
        owner = address(this);
        greeter = new MonadGreeter("Init");
    }

    function test_FullLifecycleFlow() public {
        string memory update1 = "Monad is fast";
        string memory update2 = "Monad is cheap";

        // 1. Initial Check
        assertEq(greeter.getGreeting(), "Init");

        // 2. First Update
        vm.startPrank(owner);
        greeter.setGreeting(update1);
        vm.stopPrank();
        assertEq(greeter.getGreeting(), update1);

        // 3. Second Update
        vm.startPrank(owner);
        greeter.setGreeting(update2);
        vm.stopPrank();
        assertEq(greeter.getGreeting(), update2);
    }
}
