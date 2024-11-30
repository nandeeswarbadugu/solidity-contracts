// Calling another smart contract without inheritance using public address of the contract
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//define interface

interface IArithmetic {
    // only function definition
    function add(uint8 value) external;
    function subtract(uint8 value) external;
    function multiply(uint8 value) external;
    function divide(uint8 value) external;
    function getNum() external view returns(uint8);
}

contract Calling {

    address private contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function proxyAdd(uint8 value) public {
        IArithmetic(contractAddress).add(value);
    }

    function proxyGetNum() public view returns(uint8) {
        return IArithmetic(contractAddress).getNum();
    }
    
}