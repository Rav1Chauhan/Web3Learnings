// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Parent Contract
contract Animal {
    string public species = "Animal";

    function makeSound() public pure virtual returns(string memory) {
        return "Some Sound";
    }
}

// Child Contract
contract Dog is Animal {

    function makeSound() public pure override returns(string memory) {
        return "Bark";
    }

    function getSpecies() public view returns(string memory) {
        return species;
    }
}

contract sound is Dog {

    function Sound() public pure returns(string memory) {
        return string(abi.encodePacked(super.makeSound()));
    }
}