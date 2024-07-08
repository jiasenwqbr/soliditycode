// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Hello {
    // 3445 gas
    string public message = "Hello World!"; // 状态变量

    // 3409
    function fn1() public view returns (string memory) {
        return message;
    }

    // 737. 内存中直接返回
    function fn2() public pure returns(string memory){
        return "Hello World!";
    }

    // 816
    function fn3() public pure returns(string memory){
        return fn2(); // 使用方法；函数调用函数，没有this。直接调用
    }
}