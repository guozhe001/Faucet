pragma solidity =0.8.0;
contract Token is nortal {

    constructor (address _faucet) {
        _faucet.call("withdraw", 0.1 ether);
    }


    constructor (address _faucet) {
        // 如果调用有问题，call方法会返回false，因此可以添加一个判断
        if(_faucet.call("withdraw", 0.1 ether)) {
            revert("Withdrawal from faucet failed");
        }
    }

}