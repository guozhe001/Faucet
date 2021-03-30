// SPDX-License-Identifier: GPL-3.0
pragma solidity=0.8.0;

import './ERC20Interface.sol';

contract GZToken is ERC20Interface {
  
    string public name = "GZCoin";

    string public symbol = "GZ";
    // 是以太币的最小单位的1000倍
    uint8 public decimals = 21;
    // 一共发行2千100万
    // 这个数字是描述发行多少个最小单位，比如最小单位是2，此处是10，其实发行了01个GZ
    uint256 public constant totalSupply = 21000000 * (10**21);
    // 地址和余额的映射，记录某个地址有多少余额
    mapping (address => uint256) private balances;

    mapping (address => mapping (address => uint256)) private allowed;
    
    constructor () {
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address _owner) external view override returns (uint256 balance)  {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) external override returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) external override returns (bool success) {
        uint256 remaining = allowed[_from][_to];
        require(remaining >= _value && balances[_from] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) external override returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }
    
    function allowance(address _owner, address _spender) external override view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

}
