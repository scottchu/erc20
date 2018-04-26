const Token = artifacts.require("./Gil.sol");

module.exports = function(deployer, network, accounts) {
  const initialSupply = 100

  deployer.deploy(Token, initialSupply)
}