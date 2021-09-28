// SPDX-License-Identifier: UNLICENSED
// smart contract files must start with a capital letter

// to Deploy to Rinkeby testnet. 
// Run this command from the root directory. Notice all we do is change it from localhost to rinkeby.
// npx hardhat run scripts/deploy.js --network rinkeby

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract KantoPokePortal {
    uint256 totalBulbasaurVotes;
    uint256 totalCharmanderVotes;
    uint256 totalSquirtleVotes;

    event NewVotes(address indexed from, uint256 timestamp);

    struct Vote {
        address voter; // The address of the user who votes.
        uint256 timestamp; // The timestamp when the user votes.
    }

    Vote[] votes;

    constructor() {
        console.log("I AM SMART CONTRACT. POG.");
    }

    function voteBulbasaur() public {
        totalBulbasaurVotes += 1;
        console.log("%s has voted!", msg.sender);

        votes.push(Vote(msg.sender, block.timestamp));
       
        emit NewVotes(msg.sender, block.timestamp);
    }

    function voteCharmander() public {
        totalCharmanderVotes += 1;
        console.log("%s has voted!", msg.sender);

        votes.push(Vote(msg.sender, block.timestamp));
       
        emit NewVotes(msg.sender, block.timestamp);
    }

    function voteSquirtle() public {
        totalSquirtleVotes += 1;
        console.log("%s has voted!", msg.sender);

        votes.push(Vote(msg.sender, block.timestamp));
       
        emit NewVotes(msg.sender, block.timestamp);
    }
 
    function getAllVotes() public view returns (Vote[] memory) {
        return votes;
    }

    function getTotalBulbasaurVotes() public view returns (uint256) {
        return totalBulbasaurVotes;
    }

    function getTotalCharmanderVotes() public view returns (uint256) {
        return totalCharmanderVotes;
    }

    function getTotalSquirtleVotes() public view returns (uint256) {
        return totalSquirtleVotes;
    }
}

// smart contracts are immutable
// So we need to Re-deploy
// So, when a contract is updated, we need to do a few things:

// 1. We need to deploy it again.

// 2. We need to update the contract address on our frontend.

// 3. We need to update the abi file on our frontend.  

// They can't change. They're permanent. That means changing a contract requires a full redeploy. 
// This will also reset all the variables since it'd be treated as a brand new contract.

// WHAT REQUIRED TO REDEPLOY

// 1. Deploy again using npx hardhat run scripts/deploy.js --network rinkeby

// 2. Change contractAddress in App.js to be the new contract address we got from 
// the step above in the terminal just like we did before the first time we deployed.

// 3. Get the updated abi file from artifacts