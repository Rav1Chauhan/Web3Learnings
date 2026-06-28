// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PiggyBank {

    function deposit() public payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdraw() public {
        address payable user = payable(msg.sender);

        uint amount = address(this).balance;

        (bool success, ) = user.call{value: amount}("");
        require(success, "Transfer failed");
    }
}