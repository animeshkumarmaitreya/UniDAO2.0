// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/forge-std/src/Script.sol";
import "../src/MyNFT.sol";

contract MintNFT is Script {
    function run() external {
        address recipient = 0xA6cD042740CFabDA78dB63d61b36526202b13b21;

        // Array of token URIs for the images you uploaded to IPFS
        string[] memory tokenURIs = new string[](12);
        tokenURIs[0] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Acrobatic_Silky_Anime_Infobox.webp"; // Replace with your actual IPFS URLs
        tokenURIs[1] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Aira_Shiratori_Anime_Infobox_2.webp"; // Add more URLs as needed
        tokenURIs[2] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Flatwoods_Monster_full_appearance.webp"; // Add more URLs as needed
        tokenURIs[3] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Jiji_Anime_Infobox.webp"; // Add more URLs as needed
        tokenURIs[4] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Mantis_Shrimp_Alien_Form_%2528Anime%2529.webp"; // Add more URLs as needed
        tokenURIs[5] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Momo_Ayase_Anime_Infobox_2.webp"; // Add more URLs as needed
        tokenURIs[6] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Okarun%2527s_Turbo_Granny_Form.webp"; // Add more URLs as needed
        tokenURIs[7] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Okarun_Anime_Infobox_2.webp"; // Add more URLs as needed
        tokenURIs[8] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Seiko_Ayase_Anime_Infobox.webp"; // Add more URLs as needed
        tokenURIs[9] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Serpo_Reproductive_Tool.webp"; // Add more URLs as needed
        tokenURIs[10] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Turbo_Granny_%2528Doll%2529_Infobox_%2528Anime%2529.webp"; // Add more URLs as needed
        tokenURIs[11] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Unji_Zuma_Infobox.webp"; // Add more URLs as needed

        vm.startBroadcast();

        MyNFT nft = MyNFT(0x3601829F59F17C475E305aC12D1b956b445d0876);

        for (uint256 i = 0; i < tokenURIs.length; i++) {
            uint256 tokenId = nft.mintNFT(recipient, tokenURIs[i]);
            console.log("Minted NFT with ID:", tokenId, "and URI:", tokenURIs[i]);
        }

        vm.stopBroadcast();
    }
}
