// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT nft;

    function setUp() public {
        nft = new MyNFT();
    }

    function testMintMultipleNFTs() public {
        address recipient = address(0xA6cD042740CFabDA78dB63d61b36526202b13b21);
        // Array of token URIs for the images you uploaded to IPFS
        string[] memory tokenURIs = new string[](12);
        tokenURIs[0] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Acrobatic_Silky_Anime_Infobox.webp"; 
        // ACROSILKY
        tokenURIs[1] = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Aira_Shiratori_Anime_Infobox_2.webp"; 
        // AIRA_CHAN
       

        for (uint256 i = 0; i < tokenURIs.length; i++) {
            uint256 tokenId = nft.mintNFT(recipient, tokenURIs[i]);
            assertEq(nft.ownerOf(tokenId), recipient);
            assertEq(nft.tokenURI(tokenId), tokenURIs[i]);
        }
    }

    function testChangeTokenURI() public {
        address recipient = address(0xA6cD042740CFabDA78dB63d61b36526202b13b21);
        string memory tokenURI = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Acrobatic_Silky_Anime_Infobox.webp";
        string memory newTokenURI = "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Aira_Shiratori_Anime_Infobox_2.webp";

        uint256 tokenId = nft.mintNFT(recipient, tokenURI);

        vm.startPrank(recipient);
        nft.changeTokenURI(tokenId, newTokenURI);
        vm.stopPrank();

        assertEq(nft.tokenURI(tokenId), newTokenURI);
    }

    function testFailMintExceedMaxSupply() public {
        for (uint256 i = 0; i < 3000; i++) {
            nft.mintNFT(address(this), "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Acrobatic_Silky_Anime_Infobox.webp");
        }
        nft.mintNFT(address(this), "https://aqua-rear-tyrannosaurus-290.mypinata.cloud/ipfs/bafybeigfomcerlap2ixqrvso6ee2avwrfzt5fyq5cqirsqehpofgzvpyaq/Acrobatic_Silky_Anime_Infobox.webp"); // This should fail
    }
}