// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// 0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC
contract Inheritance {
    // what do I need 
    address private owner;
    address private receipent;
    uint private startTime;
    uint private timeToHold;
    uint private lastVisited;

    constructor(address _receipent){
        receipent = _receipent;
        owner = msg.sender;
        startTime = block.timestamp;
        lastVisited = block.timestamp;
        timeToHold = 10;
        
    }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    modifier onlyReceipent(){
        require(msg.sender == receipent);
        _;
    }

    function deposit() public payable onlyOwner{
        
        
    }

    function ping() public onlyOwner{
        lastVisited = block.timestamp;
    }

    function claim() external payable onlyReceipent {
        require(lastVisited < block.timestamp - timeToHold);
        payable(receipent).transfer(address(this).balance);
    }

}