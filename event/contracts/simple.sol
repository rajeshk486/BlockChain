
pragma solidity >=0.4.21 <0.6.0;

contract simple {
  address public owner;
  uint id;
  uint public last_completed_migration;

  constructor() public {
    owner = msg.sender;
  }

    function setid(uint _id) public {
      id =_id;
    }
  
  function getid() public returns(uint)
  {
    return id;
  }


  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }


}

