// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.4 <0.9.0;

contract Example {
    event Debug(string message, uint256 value, uint256 gasLeft);
    function f() public payable returns (bytes4) {
        assert(this.f.address == address(this));
        return this.f.selector;
    }

    function g() public payable{
        emit Debug("Before calling f", msg.value, gasleft());
        this.f{gas: 50000, value: 800}(); 
        emit Debug("After calling f", msg.value, gasleft());
    }
}