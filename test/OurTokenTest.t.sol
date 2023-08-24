// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;

    address alex = makeAddr("alex");
    address alisa = makeAddr("alisa");

    uint256 public constant STARTING_BALANCE = 100 ether;
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(msg.sender);
        ourToken.transfer(alex, 100 ether);
    }

    function testAlexBalance() public {
        assertEq(ourToken.balanceOf(alex), STARTING_BALANCE);
    }

    function testAllowances() public {
        uint256 initialBalance = 1000;

        // Alex approves Alisa to spend tokens on her behalf
        vm.prank(alex);
        ourToken.approve(alisa, initialBalance);

        uint256 transferAmoount = 500;

        vm.prank(alisa);
        ourToken.transferFrom(alex, alisa, transferAmoount);

        assertEq(ourToken.balanceOf(alisa), transferAmoount);
        assertEq(ourToken.balanceOf(alex), STARTING_BALANCE - transferAmoount);
    }

    function testDirectTransfer() public {
        uint256 transferAmount = 50 ether;

        // Alex transfers to Alisa
        vm.prank(alex);
        ourToken.transfer(alisa, transferAmount);

        assertEq(ourToken.balanceOf(alisa), transferAmount, "Alisa did not receive the correct amount after transfer");
        assertEq(
            ourToken.balanceOf(alex),
            STARTING_BALANCE - transferAmount,
            "Alex's balance was not correctly reduced after transfer"
        );
    }

    // Testing that transfers cannot exceed balance    function testMint() public {
    function testTransfer() public {
        uint256 transferAmount = 50 ether;

        vm.prank(alex);
        ourToken.transfer(alisa, transferAmount);

        assertEq(ourToken.balanceOf(alisa), transferAmount);
        assertEq(ourToken.balanceOf(alex), STARTING_BALANCE - transferAmount);
    }

    function testTotalSupply() public {
        assertEq(ourToken.totalSupply(), INITIAL_SUPPLY);
    }
}
