pragma solidity ^0.4.4;

contract HodlChicken {
  
    address public owner;
    mapping (address => uint) public pendingWithdrawals;
    uint constant DAY_IN_SECONDS = 86400;
    uint constant YEAR_IN_SECONDS = 31536000;
    uint constant LEAP_YEAR_IN_SECONDS = 31622400;
    uint constant HOUR_IN_SECONDS = 3600;
    uint constant MINUTE_IN_SECONDS = 60;
    uint16 constant ORIGIN_YEAR = 1970;
    mapping(uint => mapping(uint => mapping(uint=>Bracket))) currentBrackets;
    struct Bracket {
        mapping(address => uint) balances;
        uint penalty;
        uint startingMemberAmt;
        uint currentMemberAmt;
        uint prizePool;
        string endDate;
    }
  function HodlChicken() {
    owner = msg.sender;
  }
  function getMonth(uint year) constant returns (uint) {
      
  }
  function getYear(uint timestamp) constant returns (uint16) {
        uint secondsAccountedFor = 0;
        uint16 year;
        uint numLeapYears;
        // Year
        year = uint16(ORIGIN_YEAR + timestamp / YEAR_IN_SECONDS);
        numLeapYears = leapYearsBefore(year) - leapYearsBefore(ORIGIN_YEAR);

        secondsAccountedFor += LEAP_YEAR_IN_SECONDS * numLeapYears;
        secondsAccountedFor += YEAR_IN_SECONDS * (year - ORIGIN_YEAR - numLeapYears);

        while (secondsAccountedFor > timestamp) {
                if (isLeapYear(uint16(year - 1))) {
                        secondsAccountedFor -= LEAP_YEAR_IN_SECONDS;
                }
                else {
                        secondsAccountedFor -= YEAR_IN_SECONDS;
                }
                year -= 1;
        }
        return year;
    }
    function leapYearsBefore(uint year) constant returns (uint) {
            year -= 1;
            return year / 4 - year / 100 + year / 400;
    }
    function isLeapYear(uint16 year) constant returns (bool) {
        if (year % 4 != 0) {
                return false;
        }
        if (year % 100 != 0) {
                return true;
        }
        if (year % 400 != 0) {
                return false;
        }
        return true;
    }

    function getDaysInMonth(uint8 month, uint16 year) constant returns (uint8) {
            if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
                    return 31;
            }
            else if (month == 4 || month == 6 || month == 9 || month == 11) {
                    return 30;
            }
            else if (isLeapYear(year)) {
                    return 29;
            }
            else {
                    return 28;
            }
    }
  
}
