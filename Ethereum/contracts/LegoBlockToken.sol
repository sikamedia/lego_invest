pragma solidity ^0.4.24
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";

contract LegoBlockToken is ERC721Full {
    constructor () ERC721Full("LegoBlockIdentityToken", "LBIT") public {
    }

    function mintUniqueTokenTo(address to, uint256 tokenId, string tokenURI) public {
        super._mint(to, tokenId);
        super._setTokenURI(tokenId, tokenURI);
    }
}