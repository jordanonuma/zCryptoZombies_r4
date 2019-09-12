pragma solidity ^0.4.25;
import "./ZombieAttack.sol";
import "./ERC721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {
    function balanceOf(address _owner) external view returns (uint256) {
    
    } //end function balanceOf()

    function ownerOf(uint256 _tokenId) external view returns (address) {
    
    } //end function ownerOf()
} //end contract ZombieOwnership{}