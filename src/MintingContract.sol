// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./ERC721A/ERC721A.sol";

contract MintingContract is ERC721A {
  mapping (address => uint8) numberMinted;
  uint8 constant MAX_ALLOWED_TO_MINT = 5;
  constructor() ERC721A("Foo's Bar", "FOO") { }

  //Using to demonstrate ERC721A's built in Reentrancy guard.
  function mintNft(uint8 quantity) public {
    require(quantity < MAX_ALLOWED_TO_MINT, "Trying to mint more than maximum allowed");
    require(numberMinted[msg.sender] + quantity < MAX_ALLOWED_TO_MINT, "Trying to mint more than allowed");
    
    _safeMint(msg.sender, quantity);
    numberMinted[msg.sender] += quantity;
  }
}
