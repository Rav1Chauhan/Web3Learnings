// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank {

    uint public balance;

    function deposit(uint amount)
        public
        virtual
    {
        balance += amount;
    }
}

contract PremiumBank is Bank {

    function deposit(uint amount)
        public
        override
    {
        balance += amount + 10;
    }
}