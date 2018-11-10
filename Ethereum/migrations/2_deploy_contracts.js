var LegoSTOToken = artifacts.require("LegoSTOToken");
var ESEKToken = artifacts.require("ESEKToken");

module.exports = function (deployer) {
    deployer.deploy(LegoSTOToken);
    deployer.deploy(ESEKToken);
};