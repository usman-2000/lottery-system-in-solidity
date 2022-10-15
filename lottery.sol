// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract LotterySystem{
    address public manager;
    address payable[] public participants;

    constructor() {
        manager = msg.sender;
    }

    receive() external payable {
        require(msg.value >= 1 ether);
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        require(msg.sender == manager);
        return address(this).balance;
    }

    // function sendToUser(uint indx) public {
    //     participants[indx].transfer(3 ether);
    // }

    function random() public view  returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));
    }
    function selectWinner() public view returns(address){
        require(msg.sender == manager);
        require(participants.length>=3);

        uint r = random();
        uint index = r  % participants.length;
        address payable winner;

        winner = participants[index];
        return winner;


    }


}
