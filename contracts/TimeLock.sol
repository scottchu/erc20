import "zeppelin-solidity/contracts/token/ERC20/TokenTimelock.sol";

import "./Gil.sol";

contract TimeLock is TokenTimelock {

  uint256 public duration;

  constructor(
    Gil _token,
    address _beneficiary,
    uint256 _duration
  ) public TokenTimelock(
    _token,
    _beneficiary,
    now + _duration
  ) {
    duration = _duration;
  }
}