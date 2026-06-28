// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Donation {

    event DonationReceived(address donor, uint amount);

    receive() external payable {
        emit DonationReceived(msg.sender, msg.value);
    }

    fallback() external payable {
        revert("Function does not exist");
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}