pragma solidity ^0.4.4;

contract HodlChicken {
  
    address public owner;
    mapping (address => uint) public pendingWithdrawals;
    struct Bracket {
        mapping(address => uint) balances;
        uint penalty;
        uint startingMemberAmt;
        uint currentMemberAmt;
        uint prizePool;
        string endDate;
    }
    mapping(uint => mapping(uint => Bracket)) currentBrackets;


  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function HodlChicken() {
    owner = msg.sender;
  }

  function getTime() external returns (uint){
    // return getYear(now);
    return now;
  }
  function getDay(uint _timestamp) returns(uint){
     return  (_timestamp/ (60*60*24)) % 31;
  }
  function getMonth(uint _timestamp) returns(uint){
     return  (_timestamp / (60*60*24*31)) % 12;
  }
  function getYear(uint _timestamp) returns (uint) {
    return (_timestamp) / (60*60*24*31*12);
  }
  
}
