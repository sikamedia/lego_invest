pragma solidity ^0.4.24;
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";

contract LegoBlockToken is ERC721Full {
    mapping(uint256 => uint) private _tokenPrice;

    constructor () ERC721Full("LegoBlockIdentityToken", "LBIT") public {
    }

    function mintUniqueTokenTo(address to, uint256 tokenId, string tokenURI) public {
        super._mint(to, tokenId);
        //super._setTokenURI(tokenId, tokenURI);
    }

    function setTokenPrice(uint256 tokenId, uint eSek) public {
        require(_exists(tokenId));
        require(msg.sender == ownerOf(tokenId));
        _tokenPrice[tokenId] = eSek;
    }

    function getTokenPrice(uint256 tokenId) external view returns (uint) {
        require(_exists(tokenId));
        return _tokenPrice[tokenId];
    }
}