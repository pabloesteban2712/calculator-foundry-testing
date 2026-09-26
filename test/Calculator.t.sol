// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {calculatorSC} from "../src/calculator.sol";

contract CalculatorTest is Test {

    // TYPE - ATTRIBUTE - INSTANCE
    calculatorSC public calculator;

    uint256 public idealResult = 100; 
    uint256 public result;
    address public admin      = vm.addr(1);
    address public randomUser = vm.addr(2);

    // RUNS JUST BEFORE EVERY TEST
    function setUp() public {
        calculator = new calculatorSC(admin); 
    }

    // UNIT TESTING
    function testAddition() public {
        result = calculator.addition(10, 90);
        assert(idealResult == result);
    }
    
    function testSubstraction() public {
        result = calculator.substraction(200, 100);
        assert(idealResult == result);
    }
    
    function testMultiplier() public {
        result = calculator.multiplier(50, 2);
        assert(idealResult == result);
    }

    function testCanNotMultiply2Numbers() public {
        vm.expectRevert();
        calculator.multiplier(115792089237316195423570985008687907853269984665640564039457584007913129639934, 5);
    }

    // FUZZING TESTING
    function testDivisionWithoutBeingAdmin() public {
        vm.startPrank(randomUser);

        calculator.division(5, 2);
        
        vm.stopPrank();
    }

    function testDivisionBeingAdmin() public {
        vm.startPrank(admin);

        calculator.division(5, 2);
        
        vm.stopPrank();
    }

    function testDivisionCanNotDivideByZero() public {
        vm.startPrank(admin);

        vm.expectRevert();
        calculator.division(2,0);
        
        vm.stopPrank();
    }

    function testFuzzingDivision(uint256 _firstNumber, uint256 _secondNumber) public {
        vm.startPrank(admin);

        calculator.division(_firstNumber, _secondNumber);
        
        vm.stopPrank();
    }
}