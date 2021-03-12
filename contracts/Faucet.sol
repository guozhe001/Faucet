// SPDX-License-Identifier: GPL-3.0

pragma solidity =0.8.0;


contract owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "only owner can invoke this method!");
        _;
    }
}


contract nortal is owned {

    function destroy() external onlyOwner {
        selfdestruct(payable(owner));
    }
}

// my first contract
contract Faucet is nortal {

    event Withdrawal(address indexed to, uint amount);

    event Deposit(address indexed to, uint amount);

    // Give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public {
        // limit withdrawal amount
        require(withdraw_amount <= 0.1 ether);

        payable(msg.sender).transfer(withdraw_amount);

        emit Withdrawal(msg.sender, withdraw_amount);
    }

    // Accept any incoming amount 一个默认的函数
    // fallback () external payable {}

    // 推荐使用receive()函数来接收以太币
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

}
