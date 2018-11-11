pragma solidity ^0.4.24;

import "./LegoBlockToken.sol";
import "./LegoBlockOwner.sol";
import "./LegoFinancialInvestor.sol";

contract LegoBuilder {
    address private owner;
    address private blockProvider;
    address private fundProvider;

    bool blockReceived = false;
    bool fundReceived = false;

    uint private totalShare = 100;
    LegoBlockToken private legoBlockToken;
    uint private buildingFund;

    constructor () public {
        owner = msg.sender;
    }

    function blockRxCallback(LegoBlockToken blockToken) {
        blockProvider = msg.sender;
        legoBlockToken = blockToken;
        blockReceived = true;

        legoBlockToken.setTokenPrice(0, 10);
        legoBlockToken.setTokenPrice(1, 11);
        legoBlockToken.setTokenPrice(2, 12);
        legoBlockToken.setTokenPrice(3, 13);
        legoBlockToken.setTokenPrice(4, 14);
        legoBlockToken.setTokenPrice(5, 15);
        legoBlockToken.setTokenPrice(6, 16);
        legoBlockToken.setTokenPrice(7, 17);
        legoBlockToken.setTokenPrice(8, 18);
        legoBlockToken.setTokenPrice(9, 19);

        if (blockReceived && fundReceived) {
            LegoBlockOwner blockOwner = LegoBlockOwner(blockProvider);
            blockOwner.setShare(50);
            LegoFinancialInvestor investor = LegoFinancialInvestor(fundProvider);
            investor.setShare(totalShare - 50);
        }
    }

    function fundRxCallback(uint eSek) {
        fundProvider = msg.sender;
        buildingFund = eSek;
        fundReceived = true;

        if (blockReceived && fundReceived) {
            LegoBlockOwner blockOwner = LegoBlockOwner(blockProvider);
            blockOwner.setShare(50);
            LegoFinancialInvestor investor = LegoFinancialInvestor(fundProvider);
            investor.setShare(totalShare - 50);
        }
    }

    function getBlockPrice(uint blockId) public returns (uint) {
        require(blockReceived == true);
        return legoBlockToken.getTokenPrice(blockId);
    }

    function buyBlock(uint blockId, uint eSek) public {
        require(blockReceived == true && fundReceived == true);
        uint price = legoBlockToken.getTokenPrice(blockId);
        require(eSek >= price);
        LegoBlockOwner blockOwner = LegoBlockOwner(blockProvider);
        LegoFinancialInvestor investor = LegoFinancialInvestor(fundProvider);
        uint blockOwnerShare = blockOwner.getShare();
        uint investorShare = investor.getShare();
        blockOwner.payback(eSek * blockOwnerShare / (blockOwnerShare + investorShare));
        blockOwner.payback(eSek * investorShare / (blockOwnerShare + investorShare));
        legoBlockToken.transferFrom(owner, msg.sender, blockId);
    }
}