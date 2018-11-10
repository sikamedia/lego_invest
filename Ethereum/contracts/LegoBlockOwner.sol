pragma solidity ^0.4.24

import "LegoBlockToken.sol";

contract LegoBlockOwner {
    Address public owner;
    Address public investedTarget;
    LegoBlockToken private ownedBlocks = LegoBlockToken();
    uint private holdingShare = 0;
    uint private esekBalance = 0;

    constructor () public {
        owner = msg.sender;

        ownedBlocks.mintUniqueTokenTo(msg.Sender, 0, "http://block.domain/info/0");
        ownedBlocks.mintUniqueTokenTo(msg.Sender, 1, "http://block.domain/info/1");
        ownedBlocks.mintUniqueTokenTo(msg.Sender, 2, "http://block.domain/info/2");
        ownedBlocks.mintUniqueTokenTo(msg.Sender, 3, "http://block.domain/info/3");
        ownedBlocks.mintUniqueTokenTo(msg.Sender, 4, "http://block.domain/info/4");
        ownedBlocks.mintUniqueTokenTo(msg.Sender, 5, "http://block.domain/info/5");
        ownedBlocks.mintUniqueTokenTo(msg.Sender, 6, "http://block.domain/info/6");
        ownedBlocks.mintUniqueTokenTo(msg.Sender, 7, "http://block.domain/info/7");
        ownedBlocks.mintUniqueTokenTo(msg.Sender, 8, "http://block.domain/info/8");
        ownedBlocks.mintUniqueTokenTo(msg.Sender, 9, "http://block.domain/info/9");

    }

    function invest (address to) public {
        require(msg.sender == owner);
        investedTarget = to;
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