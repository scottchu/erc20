const FireSale = artifacts.require("./FireSale.sol")
const Gil = artifacts.require("./Gil.sol")

const { BigNumber } = web3

module.exports = async function(deployer, network, accounts) {
  // set the exchange rate between ETH and GIL
  const rate = new BigNumber(1)

  // use first account as wallet
  const wallet = accounts[0]

  // get the deployed Gil instance
  const token = await Gil.deployed()

  // get the balance of the wallet account
  const amount = await token.balanceOf(wallet)

  // deploy the FireSale contract
  await deployer.deploy(FireSale, rate, wallet, Gil.address)

  // get the deployed FireSale instance
  const crowdsale = await FireSale.deployed()

  // // transfer amount of tokens from master account
  // // to the crowdsale account
  await token.transfer(crowdsale.address, amount)
}