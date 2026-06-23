// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    event VoteCast(
        address indexed voter,
        string candidate
    );

    function vote(
        string memory _candidate
    ) public {

        emit VoteCast(
            msg.sender,
            _candidate
        );
    }
}