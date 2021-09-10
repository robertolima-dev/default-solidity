// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

library SafeMath {

    // Funções pure não consultam e nem alteram, só tratam parametros
    function sum(uint a, uint b) internal pure returns(uint) {
        uint c = a + b; 
        require(c >= a, "Sum Overflow!");

        return c;
    }

    function sub(uint a, uint b) internal pure returns(uint) {
        require(b <= a, "Sub Underflow!");
        uint c = a - b; 

        return c;
    }

    function mult(uint a, uint b) internal pure returns(uint) {
        if(a == 0) {
            return 0;
        }

        uint c = a * b; 
        require(c / a == b, "Mult Overflow!");

        return c;
    }

    function div(uint a, uint b) internal pure returns(uint) {
        uint c = a / b;

        return c;
    }
}

contract Ownable {
    address payable public owner;

    event OwnershipTransferred(address newOwner);

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner!");
        _;
    }

    function transferOwnership(address payable newOwner) onlyOwner public {
        owner = newOwner;

        emit OwnershipTransferred(owner);
    }

}

contract Default is Ownable{
    using SafeMath for uint;

    
}
