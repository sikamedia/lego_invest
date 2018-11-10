pragma solidity ^0.4.24

contract LegoFinancialInvestor {
    Address public owner;
    Address public investedTarget;
    uint private holdingShare = 0;
    uint private esekBalance = 0;

    constructor (uint esek) public {
        owner = msg.sender;
        esekBalance = esek;
    }

    function invest (address to) public {
        require(msg.sender == owner);
        investedTarget = to;

    }

    function setShare (uint share) public {
        require(msg.sender == investedTarget);
        holdingShare = share;
    }

    function getShare () public returns(uint) {
        return holdingShare;
    }

    function payback (uint esek) public {
        require(msg.sender == investedTarget);
        esekBalance += esek;
    }
}