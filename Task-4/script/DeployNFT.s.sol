// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/forge-std/src/Script.sol";
import "../src/MyNFT.sol";

contract DeployNFT is Script {
    function run() external {
        vm.startBroadcast();

        MyNFT nft = new MyNFT();
        console.log("Deployed MyNFT contract at:", address(nft));

        vm.stopBroadcast();
    }
}
