// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { Test } from "forge-std/Test.sol";
import { MonadGreeter } from "../../src/MonadGreeter.sol";

contract MonadGreeterTest is Test {
    MonadGreeter public greeter;
    address public owner;
    address public user = makeAddr("user");

    // Events to check against
    event GreetingChanged(address indexed user, string newGreeting);

    function setUp() public {
        owner = address(this);
        greeter = new MonadGreeter("Hello Monad");
    }

    // 1. Test Initial State
    function test_InitialGreetingIsCorrect() public view {
        assertEq(greeter.getGreeting(), "Hello Monad");
    }

    function test_OwnerIsSetCorrectly() public view {
        assertEq(greeter.getOwner(), owner);
    }

    // 2. Test Positive Logic (Owner can update)
    function test_OwnerCanUpdateGreeting() public {
        string memory newGreeting = "Speed is Key";

        vm.expectEmit(true, false, false, true);
        emit GreetingChanged(owner, newGreeting);

        // No prank needed as test contract is owner
        greeter.setGreeting(newGreeting);
        assertEq(greeter.getGreeting(), newGreeting);
    }

    // 3. Test Negative Logic (User cannot update)
    function test_RevertWhen_NonOwnerUpdates() public {
        vm.prank(user);
        vm.expectRevert(MonadGreeter.MonadGreeter__NotOwner.selector);
        greeter.setGreeting("Hacker Message");
    }

    // 4. Test Validation (Cannot set empty)
    function test_RevertWhen_SettingEmptyGreeting() public {
        vm.expectRevert(MonadGreeter.MonadGreeter__EmptyGreeting.selector);
        greeter.setGreeting("");
    }
}
