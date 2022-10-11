// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract LotterySystem{
    address public manager;
    address payable[] public participants;

    constructor() {
        manager = msg.sender;
    }

    receive() external payable {
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function sendToUser(uint indx) public {
        participants[indx].transfer(3 ether);
    }


}
