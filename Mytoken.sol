// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RaviCoin {
    address public owner;
    uint public totalsupply;
    mapping(address => uint) balances;
    constructor() {
        owner = msg.sender;
    }

    modifier OnlySender() {
        require(msg.sender == owner, " Not owner");
        _;
    }

    function mint(uint value) public payable OnlySender {
        balances[owner] += value;
    }

    function mintTo(uint value, address to) public payable OnlySender {
        balances[to] += value;
        totalsupply += value;
    }

    function transfer(uint value, address to) public payable {
        uint existingBalance = balances[msg.sender];
        require(existingBalance >= value, "Insufficient Balance");
        balances[to] += value;
        balances[msg.sender] -= value;
    }
}
