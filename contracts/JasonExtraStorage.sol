// I'm a comment!
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;
import "./JasonStorage.sol";
contract JasonExtraStorage is JasonStorage {
    function store(uint256 _favoriateNumber) public override {
        favoriateNumber = _favoriateNumber + 5;
    }
    
}