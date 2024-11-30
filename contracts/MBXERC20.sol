
 // SPDX-License-Identifier: MIT
 pragma solidity ^0.8.0;

 contract MBXERC20 {

    string private name;
    string private symbol;
    uint8 private decimals;
    uint256 private totalSupply;
    address private owner;
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowances;

    // emit events after transaction

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor(string memory _name, string memory _symbol, uint8 _decimals) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        owner = msg.sender;

    }

    modifier onlyOwner(){
        require(owner == msg.sender, "Only owner can call the function");
        _;
    }

    
        // return name of the token
    function getName() public view returns(string memory){
        return name;
    }
    function getSymbol() public view returns(string memory){
        return symbol;
    }
    function getDecimals() public view returns(uint8){
        return decimals;
    }
    function getTotalSupply() public view returns(uint256){
        return totalSupply;
    }

    function mint(uint _amount) public onlyOwner{
        balances[msg.sender] += _amount;
        totalSupply += _amount;
    }

    function mintTo(address to, uint _amount) public onlyOwner {
        balances[to] += _amount;
        totalSupply += _amount;
    }

    function transferOwnerShip(address _address) public onlyOwner {
        owner = _address;
    }

    function renounceOwnership() public onlyOwner {
        owner = address(0);
    }

    // function to fetch balance of user
    function balanceOf(address _owner) public view returns(uint256 balance){
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        uint256 currBalance = balances[msg.sender];
        require(currBalance > _value, "Insufficient funds");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        uint256 allowedBalance = allowances[_from][_to];
        require(allowedBalance >= _value ,"allowed balance exceeds transfer balance");
        allowances[_from][_to] -= _value;
        balances[_from] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        emit Approval(_from, _to, allowances[_from][_to]);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success){
        require(balances[msg.sender] > _value, "insufficient funds to authorize");
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;        
    }

    function allowance(address _owner, address _spender) public view returns(uint256 remaining){
        return allowances[_owner][_spender];
    }

    
    function burn(uint256 _value)public returns (bool){
        require(balances[msg.sender] >= _value, "Insufficent funds to burn");
        totalSupply -= _value;
        balances[msg.sender] -= _value;

    }
    

 }


// function name() public view returns (string)
// function symbol() public view returns (string)
// function decimals() public view returns (uint8)
// function totalSupply() public view returns (uint256)
// function balanceOf(address _owner) public view returns (uint256 balance)
// function transfer(address _to, uint256 _value) public returns (bool success)
// function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
// function approve(address _spender, uint256 _value) public returns (bool success)
// function allowance(address _owner, address _spender) public view returns (uint256 remaining)
