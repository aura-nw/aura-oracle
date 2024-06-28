// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {PriceFeed} from "../src/PriceFeed.sol";

contract PriceFeedTest is Test {
    PriceFeed public priceFeed;

    function setUp() public {
        priceFeed = new PriceFeed(0, 0);
        priceFeed.setDecimals(8);
        priceFeed.setPrice(1_000_000);
    }

    function testGetter() public view {
        assertEq(priceFeed.decimals(), 8);
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        assertEq(answer, 1_000_000);
    }
}
