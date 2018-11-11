var LegoSTOToken = artifacts.require("LegoSTOToken");
var ESEKToken = artifacts.require("ESEKToken");
var LegoBlockOwner = artifacts.require("LegoBlockOwner");
var LegoBuilder = artifacts.require("LegoBuilder");
var LegoFinancialInvestor = artifacts.require("LegoFinancialInvestor");
var LegoBlockToken = artifacts.require("LegoBlockToken");

module.exports = function (deployer) {
  deployer.deploy(LegoSTOToken);
  deployer.deploy(ESEKToken);
  deployer.deploy(LegoBlockOwner);
  deployer.deploy(LegoBuilder);
  deployer.deploy(LegoFinancialInvestor, 100);
  deployer.deploy(LegoBlockToken);

};

