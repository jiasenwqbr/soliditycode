// SPDX-License-Identifier: MIT
pragma solidity  0.8.17;
contract SimpleStorage  {
    //boolean,uint ,int ,address, bytes
    // This gets initialized to zero
    // <- This means that section is a commit!
    uint256 public favoriteNumber;
    struct People{
        uint256 favoriteNumber;
        string name;
    }
    People[] public people ;//= People({favoriteNumber:2,name:"Jason"}); 


    function store(uint256  _favoriateNumber) public {
        favoriteNumber = _favoriateNumber;
    }
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    function addPeople(string memory _name,uint256 _favoriateNumber) public {
        people.push(People(favoriateNumber,_name));
    }
    
}