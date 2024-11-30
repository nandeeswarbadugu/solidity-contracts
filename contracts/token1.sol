// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract KiratCoin {

    address public owner;
    uint public totalSupply;
    mapping(address => uint) public  balances;

    constructor() {
        owner  = msg.sender;
    }


    modifier onlyOwner() {
        require(msg.sender == owner , "Only owner can call the function");
        _;
    }

    function mint(uint amount) public onlyOwner{
        balances[owner] += amount;
        totalSupply += amount;
    }

    function mintTo(address to, uint amount) private onlyOwner{
        balances[to] += amount;

    }
}