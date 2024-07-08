// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title  一个简单的数据存储演示
/// @author Anbang
/// @notice 您智能将此合约用于最基本的演示
/// @dev    提供了存储方法/获取方法
/// @custom:xx    自定义的描述/这个是实验的测试合约
contract  TinyStorage {
    // data
    uint256 storedData;

    /// @notice 储存 x
    /// @param _x: storedData 将要修改的值
    /// @dev   将数字存储在状态变量 storedData 中
    function set(uint256 _x) public{
        storedData = _x;
    }

    /// @notice 返回存储的值
    /// @return 储存值
    /// @dev   检索状态变量 storedData 的值
    function get() public view returns(uint256){
        return storedData;
    }


    /**
     * @notice 第二种写法
     * @param _x: XXXXX
     * @dev   XXXXX
     * @return XXXXX
     * @inheritdoc :
     */


     
}