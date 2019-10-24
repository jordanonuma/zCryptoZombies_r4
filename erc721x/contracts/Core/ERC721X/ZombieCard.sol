pragma solidity ^0.4.25;
import "./ERC721XToken.sol";
import "./Ownable.sol";

contract ZombieCard is ERC721XToken {
    mapping (uint => uint) internal tokenIdToIndividualSupply;
    event TokenAwarded(uint indexed tokenId, address claimer, uint amount);
    
    function name() external view returns(string) {
        return "ZombieCard";
    }  //end function name()

    function symbol() external view returns(string) {
        return "ZCX";
    } //end function symbol()

    function individualSupply(uint _tokenId) public view returns(uint) {
        return tokenIdToIndividualSupply[_tokenId];
    } //end function individualSupply()

    function mintToken(uint _tokenId, uint _supply) public onlyOwner {
        require(!exists(_tokenId), "Error: Tried to mint duplicate token id");
        _mint(_tokenId, msg.sender, _supply);
        tokenIdToIndividualSupply[_tokenId] = _supply;
    } //end function mintToken()

    function awardToken(uint _tokenId, address _to, uint _amount) public onlyOwner {
        require(exists(_tokenId), "TokenID has not been minted");
        if(individualSupply[_tokenId] > 0) {
            require(_amount <= balanceOf(msg.sender, _tokenId), "Quantity greater than remaining cards");
        } //end if()
    } //end function awardToken()
} //end contract ZombieCard {}