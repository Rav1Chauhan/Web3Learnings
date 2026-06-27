// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OnlineStoreVault {

    address public owner;
    bool public paused;

    error NotOwner();
    error ContractPaused();

    constructor() {
        owner = msg.sender;
    }

    // Only the owner can call the function
    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    // Function can execute only when contract is active
    modifier whenNotPaused() {
        if (paused) revert ContractPaused();
        _;
    }

    // Customers pay for products
    function buyProduct() external payable {
        require(msg.value > 0, "Send ETH");
    }

    // Owner can pause the contract
    function pause() external onlyOwner {
        paused = true;
    }

    // Owner can resume the contract
    function unpause() external onlyOwner {
        paused = false;
    }

    // Owner withdraws all collected payments
    function withdraw()
        external
        onlyOwner
        whenNotPaused
    {
        uint256 balance = address(this).balance;

        (bool success, ) = payable(owner).call{value: balance}("");
        require(success, "Transfer failed");
    }
}