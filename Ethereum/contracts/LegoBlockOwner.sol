pragma solidity ^0.4.24;

import "./LegoBlockToken.sol";
import "./LegoBuilder.sol";

contract LegoBlockOwner {
    address private owner;
    address private legoBuilderAddress;
    LegoBlockToken private ownedBlocks;
    uint private holdingShare = 0;
    uint private balance = 0;

    constructor () public {
        owner = msg.sender;
        ownedBlocks = LegoBlockToken(owner);
        ownedBlocks.mintUniqueTokenTo(msg.sender, 0, "http://block.domain/info/0");
        /**
        ownedBlocks.mintUniqueTokenTo(msg.sender, 1, "http://block.domain/info/1");
        ownedBlocks.mintUniqueTokenTo(msg.sender, 2, "http://block.domain/info/2");
        ownedBlocks.mintUniqueTokenTo(msg.sender, 3, "http://block.domain/info/3");
        ownedBlocks.mintUniqueTokenTo(msg.sender, 4, "http://block.domain/info/4");
        ownedBlocks.mintUniqueTokenTo(msg.sender, 5, "http://block.domain/info/5");
        ownedBlocks.mintUniqueTokenTo(msg.sender, 6, "http://block.domain/info/6");
        ownedBlocks.mintUniqueTokenTo(msg.sender, 7, "http://block.domain/info/7");
        ownedBlocks.mintUniqueTokenTo(msg.sender, 8, "http://block.domain/info/8");
        ownedBlocks.mintUniqueTokenTo(msg.sender, 9, "http://block.domain/info/9"); */

    }

    function invest (address to) public {
        require(msg.sender == owner);
        legoBuilderAddress = to;
        ownedBlocks.transferFrom(owner, to, 0);
        ownedBlocks.transferFrom(owner, to, 1);
        ownedBlocks.transferFrom(owner, to, 2);
        ownedBlocks.transferFrom(owner, to, 3);
        ownedBlocks.transferFrom(owner, to, 4);
        ownedBlocks.transferFrom(owner, to, 5);
        ownedBlocks.transferFrom(owner, to, 6);
        ownedBlocks.transferFrom(owner, to, 7);
        ownedBlocks.transferFrom(owner, to, 8);
        ownedBlocks.transferFrom(owner, to, 9);
        LegoBuilder legoBuilder = LegoBuilder(legoBuilderAddress);
        legoBuilder.blockRxCallback(ownedBlocks);
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

    function getBalance () public returns (uint) {
        return balance;
    }
}