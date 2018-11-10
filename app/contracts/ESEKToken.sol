pragma solidity ^0.4.24;
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract ESEKToken is ERC20 {
    string public name = "E-SEK TOKEN";
    string public symbol = "EST";
    uint8 public decimals = 2;
    uint public INITIAL_SUPPLY = 1000000 * 10**2;

    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}