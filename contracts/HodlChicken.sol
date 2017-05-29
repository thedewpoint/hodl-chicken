pragma solidity ^0.4.4;

contract HodlChicken {
  
    address public owner;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function HodlChicken() {
    owner = msg.sender;
  }


  
}
