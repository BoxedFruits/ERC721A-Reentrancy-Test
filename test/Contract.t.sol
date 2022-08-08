// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "openzeppelin-contracts/contracts/utils/Address.sol";
import "src/Reenter.sol";
import "src/MintingContract.sol";

contract ContractTest is Test {
    using Address for address;
    address mintingContract;
    address reEnterContract;

    function setUp() public {
      mintingContract = address(new MintingContract());
      reEnterContract = address(new Reenter(mintingContract));
    }

    function testExample() public {
        assertTrue(true);
    }

    function testReenter() public {
        vm.expectRevert();
        reEnterContract.call(abi.encodeWithSignature("mintFromContract()"));

        // *If* the nfts were sucessfully minted they would be sent to the attacking contract address
        emit log_bytes(mintingContract.functionCall(abi.encodeWithSignature("balanceOf(address)", reEnterContract)));
    }
}
