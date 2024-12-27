// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Switch {
    address public owner;
    address public beneficiary;
    uint256 public lastAliveBlock;
    uint256 public thresholdBlocks = 10;
    event StillAlive(address indexed owner, uint256 blockNumber);
    event Sent(address indexed beneficiary, uint256 amount);

    constructor(address _beneficiary) {
        require(_beneficiary != address(0), "Beneficiary address cannot be zero");
        owner = msg.sender;
        beneficiary = _beneficiary;
        lastAliveBlock = block.number;
    }
    function still_alive() external {
        require(msg.sender == owner, "for owner");
        lastAliveBlock = block.number;
        emit StillAlive(owner, block.number);
    }
    function check_and_transfer() external {
        require(block.number > lastAliveBlock + thresholdBlocks, "owner alive");
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "no transfer done");
        (bool success, ) = beneficiary.call{value: contractBalance}("");
        require(success, "Transfer to beneficiary failed");
        emit Sent(beneficiary, contractBalance);
    }
    receive() external payable {}
}
