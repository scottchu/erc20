pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "../contracts/FireSale.sol";
import "../contracts/Gil.sol";

contract TestFireSale {
  function testInitialize() public {
    uint amount = 100;
    uint rate = 2;
    address wallet = address(this);

    Gil token = new Gil(amount);
    FireSale crowdsale = new FireSale(rate, wallet, token);

    Assert.equal(crowdsale.rate(), rate, "rate is set correctly");
    Assert.equal(crowdsale.wallet(), wallet, "wallet is set correctly");
    Assert.equal(crowdsale.token(), token, "token is set correctly");
  }
}
