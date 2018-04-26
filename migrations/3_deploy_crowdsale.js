const FireSale = artifacts.require("./FireSale.sol")
const Gil = artifacts.require("./Gil.sol")

module.exports = (deployer, network, accounts) => {
  const rate = new web3.BigNumber(1)
  const wallet = accounts[0]

  const tokenQ = Gil
    .deployed()

  const amountQ = tokenQ
    .then((token) => token.balanceOf(wallet))

  const crowdsaleQ = deployer
    .then(() => FireSale.new(rate, wallet, Gil.address))
    .then(crowdsale => {
      Promise
        .all([tokenQ, amountQ])
        .then(([token, amount]) => {
            token.transfer(crowdsale.address, amount)
        })
    })
}