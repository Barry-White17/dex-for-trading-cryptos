
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {SimpleDeFiToken} from "./../src/backend/contracts/SimpleDeFiToken.sol";

contract TransferWithAutoBurnTest is Test {
    SimpleDeFiToken token;

    address owner = address(1);
    address alice = address(2);
    address bob = address(3);

    function setUp() public {
        token = new SimpleDeFiToken();

        // Adjust according to your token's constructor and mint function.
        token.mint(alice, 1000 ether);
    }

    // ============================================
    // TEST 1: Successful transfer with auto burn
    // ============================================

    function test_TransferWithAutoBurn() public {
        uint256 amount = 100 ether;

        uint256 aliceBalanceBefore = token.balanceOf(alice);
        uint256 bobBalanceBefore = token.balanceOf(bob);
        uint256 supplyBefore = token.totalSupply();

        vm.prank(alice);
        token.transferWithAutoBurn(bob, amount);

        uint256 burnAmount = amount / 10;
        uint256 transferAmount = amount - burnAmount;

        assertEq(
            token.balanceOf(alice),
            aliceBalanceBefore - amount
        );

        assertEq(
            token.balanceOf(bob),
            bobBalanceBefore + transferAmount
        );

        assertEq(
            token.totalSupply(),
            supplyBefore - burnAmount
        );
    }

    // ============================================
    // TEST 2: Correct burn amount
    // ============================================

    function test_CorrectBurnAmount() public {
        uint256 amount = 200 ether;

        uint256 supplyBefore = token.totalSupply();

        vm.prank(alice);
        token.transferWithAutoBurn(bob, amount);

        assertEq(
            token.totalSupply(),
            supplyBefore - 20 ether
        );
    }
}