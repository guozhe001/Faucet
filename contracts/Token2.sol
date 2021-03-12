pragma solidity =0.8.0;

import './Faucet.sol';

contract Token is nortal {

    Faucet _faucet;
    
    /*
     在构造函数中增加一个入参，并且把这个入参转换成Faucet类型；
     这样做是很危险的：
     1、因为你不知道_f是不是指向Faucet合约的地址，里面有没有withdraw方法
     2、你也不知道Faucet的withdraw方法是不是你想象的那种逻辑
    */ 
    constructor(address _f) {
        _faucet = Faucet(_f);
        _faucet.withdraw(0.1 ether);
    }

}