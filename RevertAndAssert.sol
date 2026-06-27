// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract SimpleVault {
    error InsufficientBalance(uint256 requested, uint256 available);

    uint256 public totalBalance;

    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        totalBalance += msg.value;

        // Internal invariant: total balance should always match contract balance
        assert(totalBalance == address(this).balance);
    }

    function withdraw(uint256 amount) external payable {
        if (balances[msg.sender] < amount) {
            revert InsufficientBalance(amount, balances[msg.sender]);
        }

        balances[msg.sender] -= amount;
        totalBalance -= amount;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");

        // Internal invariant: accounting should always match contract balance
        assert(totalBalance == address(this).balance);
    }
}
