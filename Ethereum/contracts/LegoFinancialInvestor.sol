pragma solidity ^0.4.24;

import "LegoBuilder.sol"

contract LegoFinancialInvestor {
    address private owner;
    address private legoBuilderAddress;
    uint private holdingShare = 0;
    uint private balance;

    constructor (uint eSek) public {
        owner = msg.sender;
        balance = eSek;
    }

    function invest (address to) public {
        require(msg.sender == owner);
        legoBuilderAddress = to;
        LegoBlockBuilder blockBuilder = LegoBlockBuilder(legoBuilderAddress);
        blockBuilder.fundRxCallback(balance);
        balance = 0;
    }

    function setShare (uint share) public {
        require(msg.sender == legoBuilderAddress);
        holdingShare = share;
    }

    function getShare () public returns(uint) {
        return holdingShare;
    }

    function payback (uint eSek) public {
        require(msg.sender == legoBuilderAddress);
        balance += eSek;
    }

    function getBalance () public returns(uint) {
        return balance;
    }
}