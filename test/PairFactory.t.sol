
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {PairFactory} from "./../src/backend/contracts/PairFactory.sol";
import "./../src/backend/contracts/TokenPair.sol";
import './../src/backend/contracts/libraries/Helper.sol';

contract FactoryTest is Test {
    PairFactory factory;

    address tokenA = address(0x100);
    address tokenB = address(0x200);

    event PairCreated(
        address indexed token0,
        address indexed token1,
        address pair,
        uint256
    );

    function setUp() public {
        factory = new PairFactory();
    }

    function test_CreatePairSuccessfully() public {
        address pair = factory.createPair(tokenA, tokenB);

        assertTrue(pair != address(0));
        assertEq(factory.getPair(tokenA, tokenB), pair);
        assertEq(factory.getPair(tokenB, tokenA), pair);
        assertEq(factory.allPairs(0), pair);
        assertEq(factory.allPairsLength(), 1);
    }

    function test_CreatePairWithSortedTokens() public {
        address pair = factory.createPair(tokenB, tokenA);

        (address token0, address token1) =
            Helper.sortTokens(tokenA, tokenB);

        assertEq(factory.getPair(token0, token1), pair);
        assertEq(factory.getPair(token1, token0), pair);
    }

    function test_RevertWhenPairAlreadyExists() public {
        factory.createPair(tokenA, tokenB);

        vm.expectRevert(
            bytes("PAIR_ALREADY_EXISTS")
        );

        factory.createPair(tokenB, tokenA);
    }

    function test_RevertWhenCreatingSameTokenPair() public {
        vm.expectRevert();
        factory.createPair(tokenA, tokenA);
    }

    function test_CreatePairIncrementsArrayLength() public {
        factory.createPair(tokenA, tokenB);

        assertEq(factory.allPairsLength(), 1);

        factory.createPair(address(0x300), address(0x400));

        assertEq(factory.allPairsLength(), 2);
    }
}
