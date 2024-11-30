pragma solidity ^0.8.0;

contract Mapping {

    mapping(address => string) public users;
    

    function addUser() public {
        users[msg.sender] = "nandeeswar";
    }

    function getUser() public view returns(string memory) {
        return users[msg.sender];
    }
}