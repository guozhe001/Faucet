pragma solidity =0.8.0;

import './Faucet.sol';

contract Token is nortal {

    Faucet _faucet;

    // 在合约中创建一个其他的合约，并且给这个合约发送0.5eth；
    constructor() {
        _faucet = (new Faucet).value(0.5 ether)();
    }

    function destroy () public onlyOwner {
        _faucet.destroy();
    }

}