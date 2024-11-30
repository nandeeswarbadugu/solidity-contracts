
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract MBXToken {
    
    string public tokenName;
    string public tokenSymbol;
    uint public decimals;
    address public owner;
    uint public tokenSupply;
    mapping (address => uint) balances;

    constructor(string memory _tokenName, string memory _tokenSymbol,uint _decimals){
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
        decimals = _decimals;
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(owner == msg.sender, "Only owner is permitted to mint the tokens");
        _;
    }
    function mint(uint _amount) public onlyOwner{
        balances[msg.sender] += _amount;
        tokenSupply += _amount;
    }

    function mintTo(address to, uint _amount) public onlyOwner {
        balances[to] += _amount;
        tokenSupply += _amount;
    }

    function transferOwnerShip(address _address) public onlyOwner {
        owner = _address;
    }

    function renounceOwnership() public onlyOwner {
        owner = address(0);
    }

    function transfer(address to, uint _amount) public {
        uint currBalance = balances[msg.sender];
        require (currBalance > _amount, "Insufficient funds");
        balances[msg.sender] -= _amount;
        balances[to] += _amount;
    }

    function getBalance() public view returns (uint){
        return balances[msg.sender];
    }

    


    // function in contract
    // mint 
    // mintTo

    // transfer
    // transferTo



}