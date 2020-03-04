pragma solidity >=0.4.21 <0.7.0;

contract SuperCoin{

    string public constant name="SuperCoin";
    string public constant symbol="SPC";
    uint8 public constant decimals=18;
    address public owner;
    uint256 _totalSupply = 1000;

    mapping (address => uint) private __balanceOf;
    mapping (address => mapping (address => uint)) private __allowances;

    function SuperCoin() public {
        __balanceOf[msg.sender] = _totalSupply;
        owner = msg.sender;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
    
    function balanceOf(address _addr) public view returns (uint balance) {
        return __balanceOf[_addr];
    }
    
    function transfer(address _to, uint _value) public returns (bool success) {
        if (_value > 0 && _value <= balanceOf(msg.sender)) {
            __balanceOf[msg.sender] -= _value;
            __balanceOf[_to] += _value;
            return true;
        }
        return false;
    }
    
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        if (__allowances[_from][msg.sender] > 0 &&
            _value > 0 &&
            __allowances[_from][msg.sender] >= _value && 
            __balanceOf[_from] >= _value) {
            __balanceOf[_from] -= _value;
            __balanceOf[_to] += _value;
            __allowances[_from][msg.sender] -= _value;
            return true;
        }
        return false;
    }
    
    function approve(address _spender, uint _value) public returns (bool success) {
        __allowances[msg.sender][_spender] = _value;
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        return __allowances[_owner][_spender];
    }
}

