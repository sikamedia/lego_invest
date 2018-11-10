pragma solidity ^0.4.24;
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract LegoSTOToken is ERC20 {
    string public name = "LegoSecurityToken";
    string public symbol = "LST";
    uint8 public decimals = 2;
    uint public INITIAL_SUPPLY = 10000;

    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}