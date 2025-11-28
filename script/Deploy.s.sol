// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { Script, console2 } from "forge-std/Script.sol";
import { MonadGreeter } from "../src/MonadGreeter.sol";

contract DeployMonadGreeter is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("MONAD_TESTNET_PRIVATE_KEY");

        vm.startBroadcast();

        MonadGreeter greeter = new MonadGreeter("Hello Monad Builders!");

        vm.stopBroadcast();

        console2.log("------------------------------------------------");
        console2.log("Deployment Successful!");
        console2.log("Contract Address:", address(greeter));
        console2.log("Deployer Address:", vm.addr(deployerPrivateKey));
        console2.log("------------------------------------------------");
    }
}
