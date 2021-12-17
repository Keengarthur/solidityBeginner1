// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;
contract SimpleDatabase{

  // this is basically a mpaiing user's adress to its identity
    mapping(address=>Person) public people;

    // this is to keep track of how many people are stored in the database
   uint peopleCount = 0;

  //  this illustrates the basic make up of each person
   struct Person{
   uint _id;
   string firstname;
   string secondname;
   }

// this function adds the person to teh database
    
  function addPerson(string memory firstname_,string memory secondname_) public payable{
    // so to use this database, some amount of ether or its sub is required

    require(msg.value >0,'calling this function requires ether');
    peopleCount++;
    // this is where the person is pushed into the people array
    people[msg.sender] = Person(peopleCount,firstname_,secondname_);
    }
    
    // the owner of this contract can keep track of the amount of ether stored on this contract
    
    function getBalance() public view returns(uint){
    return address(this).balance;
    }
    
    
    
}