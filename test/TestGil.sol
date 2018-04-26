pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "../contracts/Gil.sol";

contract TestGil {
  function testTotalSupplyOnStart() public {
    uint initialSupply = 999;
    Gil token = new Gil(initialSupply);

    uint expected = initialSupply * (10 ** uint256(token.decimals()));

    Assert.equal(token.totalSupply(), expected, "total supply equals initialSupply");
  }

  function testBalanceOfOwnerOnStart() {
    uint initialSupply = 999;
    Gil token = new Gil(initialSupply);

    uint expected = initialSupply * (10 ** uint256(token.decimals()));

    uint output = token.balanceOf(address(this));

    Assert.equal(output, expected, "owner keeps initial supply");
  }
}