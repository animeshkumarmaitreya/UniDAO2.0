// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

library SimpleCounter {
    struct Counter {
        uint256 value; // Counter state
    }

    function current(Counter storage counter) internal view returns (uint256) {
        return counter.value;
    }

    function increment(Counter storage counter) internal {
        counter.value += 1;
    }

    function reset(Counter storage counter) internal {
        counter.value = 0;
    }
}

contract MyNFT is ERC721URIStorage {
    using SimpleCounter for SimpleCounter.Counter;
    SimpleCounter.Counter private _tokenIds;

    uint256 public constant MAX_SUPPLY = 3000;

    constructor() ERC721("MyNFT", "MNFT") {}

    function mintNFT(address recipient, string memory tokenURI)
        public
        returns (uint256)
    {
        require(_tokenIds.current() < MAX_SUPPLY, "Max supply reached");

        // Increment the counter
        _tokenIds.increment();

        // Get the current token ID
        uint256 newItemId = _tokenIds.current();

        // Mint the new token and set its URI
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function changeTokenURI(uint256 tokenId, string memory newTokenURI) public {
        require(ownerOf(tokenId) == msg.sender, "Only the owner can change the URI");
        _setTokenURI(tokenId, newTokenURI);
    }
}
