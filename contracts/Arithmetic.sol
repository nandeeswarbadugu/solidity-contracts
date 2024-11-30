pragma solidity ^0.8.0;

contract Arithmetic {

    uint8 public num;

    constructor(uint8 _num) {
        num = _num;
    }

    function add(uint8 value) public {
        num += value;
    }

    function subtract(uint8 value) public {
        num -= value;
    }

    function multiply(uint8 value) public {
        num *= value;
    }

    function divide(uint8 value) public {
        require(value != 0, "Can't divide by zero");
        num /= value;
    }

    function getNum() public view returns(uint8){
        return num;
    }


}

// 0xDA0bab807633f07f013f94DD0E6A4F96F8742B53