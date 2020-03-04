const SuperCoin = artifacts.require("./SuperCoin");

module.exports = function(deployer) {
    deployer.deploy(SuperCoin)
}