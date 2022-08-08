# Motivation
This is the github repo that goes along with an [article](https://mirror.xyz/dashboard/edit/fD6oQ4mLKx1oF-FSw-dxmxFDFVJtvRa_G95231Q-WVk) I made that explores the reetrancy prevention built into [ERC721A](https://github.com/chiru-labs/ERC721A). The motivation for this repository is for learning purposes after a failed attempt by me to find a bug while browsing NFT contracts late one night. I had always seen threads and articles written about ERC721A's innovative gas optimzations but have never read about their reetrancy protection. I thought it was cool so I wanted to share!


## Prequisites
[Foundry](https://getfoundry.sh/)\
[Solidity Knowledge](https://docs.soliditylang.org/en/v0.8.15/)\
[Reentrancy Attacks](https://quantstamp.com/blog/what-is-a-re-entrancy-attack)


## How to run the project
Clone the reposity by using this command in a terminal\

`` git clone https://github.com/BoxedFruits/ERC721A-Reentrancy-Test.git``

In order to run the tests and see events that help to understand the process of events, run the tests at the highest verbosity

`` forge test -vvvv``
