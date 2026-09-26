// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {calculatorSC} from "../src/Calculator.sol";

contract CalculatorScript is Script {
    calculatorSC public calculator;

    // Runs before every test
    function setUp() public {
        vm.startBroadcast();

        calculator = new calculatorSC(msg.sender);  

        vm.stopBroadcast(); 
    }
}