// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
}

contract Pausable {
    bool public paused;
}

contract MyToken is Ownable, Pausable {

    function getStatus()
        public
        view
        returns(address, bool)
    {
        return (owner, paused);
    }
}