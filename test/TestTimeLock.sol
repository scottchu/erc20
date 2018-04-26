pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "../contracts/Gil.sol";
import "../contracts/TimeLock.sol";
import "./utils/ThrowProxy.sol";

contract TestTimeLock {
  event Foo(uint x, uint y);

  function testInitialize() public {
    uint amount = 100;
    Gil token = new Gil(amount);

    address beneficiary = address(1);
    uint duration = 100 seconds;

    TimeLock lock = new TimeLock(token, beneficiary, duration);

    Assert.equal(lock.releaseTime(), now + duration,
      "release time is set correctly");
    Assert.equal(lock.token(), token,
      "token is set correctly");
    Assert.equal(lock.beneficiary(), beneficiary,
      "beneficiary is set correctly");
    Assert.equal(lock.duration(), duration,
      "duration is set correctly");
  }

  function testReleaseBeforeReleaseTime() {
    uint amount = 100;
    Gil token = new Gil(amount);

    address beneficiary = address(1);
    uint duration = 100 days;

    TimeLock lock = new TimeLock(token, beneficiary, duration);

    ThrowProxy proxy = new ThrowProxy(address(lock));

    TimeLock(address(proxy)).release();

    bool output = proxy.execute.gas(200000)();

    Assert.isFalse(output, "output is false as it throws error");
  }
}