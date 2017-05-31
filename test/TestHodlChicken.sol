pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/HodlChicken.sol";

contract TestHodlChicken {
HodlChicken chicken;
 function beforeEach() {
   chicken = HodlChicken(DeployedAddresses.HodlChicken());
  }
  function testOwnerAddressIsSet() {
    Assert.equal(tx.origin, chicken.owner(), "Owner address should be set");
  }
  function testTimeStamp(){
     Assert.equal(2017, chicken.getTime(), "Owner address should be set");
  }

}
