// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;
contract DanglingReference {
    uint[][] s;
    function f() public {
        // 存储一个指向s的最后一个数组元素的指针。
        uint[] storage ptr = s[s.length-1];
        // 删除s的最后一个数组元素。
        s.pop();
        // 写入已不在数组内的数组元素。
        ptr.push(0x42);
        // 现在向 ``s`` 添加一个新元素不会添加一个空数组，
        // 而是会产生一个长度为1的数组，元素为 ``0x42``。
        s.push();
        assert(s[s.length-1][0] == 0x42);
        
    }
}