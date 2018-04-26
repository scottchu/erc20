pragma solidity ^0.4.23;

// ====================================
// Import Templates
// ====================================
import "zeppelin-solidity/contracts/crowdsale/Crowdsale.sol";

// ====================================
// Import Contracts
// ====================================
import "./Gil.sol";

contract FireSale is Crowdsale {
  constructor(
    uint256 rate,
    address wallet,
    Gil token
  ) Crowdsale(rate, wallet, token) public {

  }
}