# Solidity Testing with Foundry

This project is focused on learning and practicing **smart contract testing with Foundry**.

The goal is to understand how to write reliable tests for Solidity contracts, verify expected behavior, test access control, simulate different users, and use fuzz testing to validate functions against a wide range of inputs.

## 🧪 Testing Topics

The tests in this project cover the following concepts:

* Unit testing
* Assertions with Foundry
* Testing contract state changes
* Testing access control
* Testing custom modifiers
* Testing `require` conditions and reverts
* Testing different users with `vm.prank`
* Using `vm.startPrank` and `vm.stopPrank`
* Generating test addresses with `vm.addr`
* Fuzz testing
* Testing arithmetic operations
* Testing edge cases

## 🛠️ Tech Stack

* **Solidity**
* **Foundry**
* **Forge**
* **Forge Standard Library**
* **Git**

## 📁 Project Structure

```text
.
├── src/
│   └── Calculator.sol
│
├── test/
│   └── Calculator.t.sol
│
├── script/
│
├── foundry.toml
└── README.md
```

## 🔬 Unit Testing

Each contract function is tested independently to verify its expected behavior.

For example, arithmetic functions are tested with known inputs and expected outputs:

```solidity
function testDivision() public {
    uint256 result = calculator.division(10, 2);

    assertEq(result, 5);
}
```

Foundry assertions are used to compare the actual result with the expected result.

Common assertions include:

```solidity
assertEq(actual, expected);
assertTrue(condition);
assertFalse(condition);
```

## 🔐 Access Control Testing

The project also tests functions protected by modifiers.

For example, if a function can only be called by an administrator, the tests verify both scenarios:

1. The administrator can execute the function.
2. A different address is rejected.

This allows the tests to verify that the access-control logic is actually enforced by the contract.

## 👤 Testing Different Users

Foundry's cheatcodes are used to simulate calls from different Ethereum addresses.

### `vm.prank`

`vm.prank` changes the `msg.sender` for the next contract call.

```solidity
vm.prank(user);

calculator.someFunction();
```

### `vm.startPrank`

`vm.startPrank` is useful when multiple calls need to be executed as the same user.

```solidity
vm.startPrank(admin);

calculator.someFunction();
calculator.anotherFunction();

vm.stopPrank();
```

This makes it possible to test contracts from the perspective of different users without deploying a new contract for every scenario.

## 🔑 Generating Test Addresses

Foundry can generate deterministic addresses using `vm.addr`.

For example:

```solidity
uint256 adminPrivateKey = 1;
address admin = vm.addr(adminPrivateKey);
```

This is useful for creating test users and assigning specific roles to them.

The tests can then simulate interactions between different actors such as:

* Admin
* Regular user
* Unauthorized user

## 💥 Testing Reverts

Testing successful execution is not enough.

The tests also verify that invalid operations correctly revert.

For example:

```solidity
vm.expectRevert();

calculator.division(10, 0);
```

This ensures that the contract rejects invalid input instead of silently producing an incorrect result.

## 🎲 Fuzz Testing

The project also uses **Foundry's built-in fuzzing capabilities**.

Instead of manually specifying every possible input, test functions can receive parameters:

```solidity
function testFuzzingDivision(
    uint256 firstNumber,
    uint256 secondNumber
) public {
    // Test logic
}
```

When the test is executed, Foundry automatically generates different values for these parameters and executes the test repeatedly.

This makes fuzz testing particularly useful for discovering unexpected behavior and edge cases that may not be covered by manually written examples.

For example, a division function can be tested with many combinations of:

* Small numbers
* La
