pragma solidity ^0.4.23;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract Gil is StandardToken {
  string public name = "Gil";
  string public symbol = "G";
  uint8 public decimals = 18;

  address private _owner;

  constructor(uint initialSupply) public {
    _owner = msg.sender;

    // Calculate totoal supply in wei
    totalSupply_ = initialSupply * (10 ** uint256(decimals));

    // Set the balance of contract owner to initial supply
    balances[_owner] = totalSupply_;

    // Emits a public event on blockchain about the transfer
    emit Transfer(address(0), _owner, totalSupply_);
  }
}