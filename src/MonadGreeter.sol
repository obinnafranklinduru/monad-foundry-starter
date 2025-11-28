// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title MonadGreeter
 * @author Obinna Franklin Duru (@BinnaDev)
 * @notice A simple greeting contract to demonstrate Monad deployment patterns
 * @dev Implements custom errors and events for gas efficiency
 */
contract MonadGreeter {
    // State Variables
    string private s_greeting;
    address private immutable i_owner;

    // Events
    event GreetingChanged(address indexed user, string newGreeting);

    // Errors
    error MonadGreeter__NotOwner();
    error MonadGreeter__EmptyGreeting();

    // Modifiers
    modifier onlyOwner() {
        if (msg.sender != i_owner) revert MonadGreeter__NotOwner();
        _;
    }

    constructor(string memory greeting) {
        if (bytes(greeting).length == 0) revert MonadGreeter__EmptyGreeting();
        s_greeting = greeting;
        i_owner = msg.sender;
    }

    /**
     * @notice Updates the greeting string
     * @dev Only callable by the owner
     * @param newGreeting The new greeting string
     */
    function setGreeting(string memory newGreeting) public onlyOwner {
        if (bytes(newGreeting).length == 0) revert MonadGreeter__EmptyGreeting();
        s_greeting = newGreeting;
        emit GreetingChanged(msg.sender, newGreeting);
    }

    /**
     * @notice Returns the current greeting
     */
    function getGreeting() public view returns (string memory) {
        return s_greeting;
    }

    /**
     * @notice Returns the owner address
     */
    function getOwner() public view returns (address) {
        return i_owner;
    }
}
