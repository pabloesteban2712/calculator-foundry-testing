// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

contract calculatorSC {
    
    // VARIABLES
    uint256 public result;
    address public admin;

    // EVENTS
    event flagOperation(uint256 _num1, uint256 _num2, uint256 result);

    // MODIFIER
    modifier AdminPermission() {
        require(msg.sender == admin,"Not allowed.");
        _;
    }

    // CONSTRUCTOR
    constructor(address _admin) {
        require(_admin != address(0), "Invalid admin");
        admin = _admin;      
    }
    
    function addition(uint256 _num1, uint256 _num2) public returns (uint256) {
        result = _num1 + _num2;
        emit flagOperation(_num1, _num2, result);
        return result;
    }

    function substraction(uint256 _num1, uint256 _num2) public returns (uint256) {
        result = _num1 - _num2;
        emit flagOperation(_num1, _num2, result);
        return result;    
    }
    
    function multiplier(uint256 _num1, uint256 _num2) public returns (uint256) {
        result = _num1 * _num2;
        emit flagOperation(_num1, _num2, result);
        return result;    
    }

    function division(uint256 _num1, uint256 _num2) public AdminPermission returns (uint256) {
        // require(_num2 > 0, "Cant no divide between Zero");
        if (_num2 == 0) return 0;
        result = _num1 / _num2;
        emit flagOperation(_num1, _num2, result);
        return result;    
    }
}