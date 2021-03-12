pragma solidity=0.8.0;

import './ERC20Interface.sol';

contract GZToken is ERC20Interface {

    string public name;

    string public symbol; 

    uint8 public decimals;

    uint256 public totalSupply;

    mapping (address => uint256) private balances;

    mapping (address => mapping (address => uint256)) private allow;

    // @override
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint256 remaining = allow[_from][_to];
        require(remaining >= _value && balances[_from] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allow[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allow[_owner][_spender];
    }

}
