// I'm a comment!
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
import "./JasonStorage.sol";
contract JasonStorageFactory {
    JasonStorage[] public simpleStorageArray;
    function createSimpleStorageContract() public {
        JasonStorage jasonStorage = new JasonStorage();
        simpleStorageArray.push(jasonStorage);
    }

    function sfStore(uint256 _jasonStorageIndex,uint256 _jasonStorageNumber) public {
        simpleStorageArray[_jasonStorageIndex].store(_jasonStorageNumber);
    }

    function sfGet(uint256 _jasonStorageIndex) public view returns (uint256){
        return simpleStorageArray[_jasonStorageIndex].retrieve();
    }

}