pragma solidity ^0.4.25;
import "./ZombieAttack.sol";
import "./ERC721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {
    function balanceOf(address _owner) external view returns (uint256) {
        return ownerZombieCount[_owner];
    } //end function balanceOf()

    function ownerOf(uint256 _tokenId) external view returns (address) {
        return zombieToOwner[_tokenId];
    } //end function ownerOf()

    function _transfer(address _from, address _to, uint256 _tokenId) private {
    
    } //end function _transfer()
} //end contract ZombieOwnership{}