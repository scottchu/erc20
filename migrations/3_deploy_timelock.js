const Token = artifacts.require("./Gil.sol");
const Timelock = artifacts.require("./Timelock.sol");

module.exports = async function(deployer, network, accounts) {
  // get the token instance
  const token = await Token.deployed()

  // set account 1 as the beneficiary
  const beneficiary = accounts[1]

  // the unlock duration is an hour from now
  const duration = 1 * 60

  // deploy the Timelock contract
  await deployer.deploy(Timelock,
    token.address,
    beneficiary,
    duration)

  // get the timelock instance
  const lock = await Timelock.deployed()

  // set the amount of token for the timelock contract
  const amount = 10000000000000000000

  // transfer the tokens to the contract
  await token.transfer(lock.address, amount)
}