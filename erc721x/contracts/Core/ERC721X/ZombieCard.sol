pragma solidity ^0.4.25;
import "./ERC721XToken.sol";

contract ZombieCard is ERC721XToken {
    mapping (uint => uint) internal tokenIdToIndividualSupply;
    
    function name() external view returns(string) {
        return "ZombieCard";
    }  //end function name()

    function symbol() external view returns(string) {
        return "ZCX";
    } //end function symbol()

    function individualSupply(uint _tokenId) public view returns(uint) {
        
    } //end function individualSupply()
} //end contract ZombieCard {}