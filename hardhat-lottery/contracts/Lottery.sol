// To enter the lottery one has to pay a certain amount
// The contract picks a random winner(using the verifiable random function)
// Winner should be selected every X minutes(which is completely automated- so no one tampers with contract at any time)
// Use of ChainLink Oracles, Randomness, Automated Execution through Chainlink Keepers that trigger the contract
// to do something once some agreement has been reached

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

error Lottery__NotEnoughETHEntered();

contract Lottery {
    /**State Variables */
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    /* Events */
    event RaffleEnter(address indexed player)

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    // Enter Lottery
    function enterLottery() public payable {
        if (msg.value < i_entranceFee) {
            revert Lottery__NotEnoughETHEntered();
        }
        s_players.push(payable(msg.sender));
        // Emmit an event when we update a dynamic array or mapping
        // Name events with the function name reversed
        emit RaffleEnter(msg.sender)
    }

    // Pick Random Winner
    function pickRandomWinner() public {}

    // Users can call the function to get entrance fee
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }
}
