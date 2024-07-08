// I'm a comment!
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;
contract JasonStorage{
    uint256 favoriateNumber;
    struct People{
        uint256 favoriateNumber;
        string name;
    }
    //uint256[] public anArray;
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriateNumber) public virtual {
        favoriateNumber = _favoriateNumber;
    }

    function retrieve() public view returns (uint256){
        return favoriateNumber;
    }
    
    function addPerson(string memory _name,uint256 _favoriateNumber) public {
        people.push(People(_favoriateNumber,_name));
        nameToFavoriteNumber[_name] = _favoriateNumber;
    }
}