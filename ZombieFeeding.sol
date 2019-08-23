pragma solidity ^0.4.25;
import "./ZombieFactory.sol";

contract KittyInterface {
    function getKitty(uint256 _id) external view returns (
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 siringWithId,
        uint256 birthTime,
        uint256 matronId,
        uint256 sireId,
        uint256 generation,
        uint256 genes
    ); //end function getKitty()
} //end contracty KittyInterface{} that calls getKitty() from cryptokitty's contract

contract ZombieFeeding is ZombieFactory {
    KittyInterface kittyContract;

    function setKittyContractAddress(address _address) external onlyOwner {
        kittyContract = KittyInterface(_address);
    } //end function setKittyContractAddress()

    function _triggerCooldown(Zombie storage _zombie) internal {
        _zombie.readyTime = uint32(now + cooldownTime);
    } //end function _triggerCooldown()

    function _isReady(Zombie storage _zombie) internal view returns (bool) {
        return (_zombie.readyTime <= now);
    } //end function _isReady()

    function feedAndMultiply(uint _zombieId, uint _targetDna, string _species) public {
        require(msg.sender == zombieToOwner[_zombieId]);
        Zombie storage myZombie = zombies[_zombieId];
        _targetDna = _targetDna % dnaModulus;
        uint newDna = (myZombie.dna + _targetDna)/2;

        if (keccak256(abi.encodePacked(_species)) == keccak256(abi.encodePacked("kitty"))) {
            newDna = newDna - newDna % 100 + 99; // (newDna % 100) gives the literal last two digits of the DNA.
        } //end if()

        _createZombie("NoName", newDna);
    } //end function feedAndMultiply()

    function feedOnKitty(uint _zombieId, uint _kittyId) public {
        (,,,,,,,,,kittyDna) = kittyContract.getKitty(_kittyId);
        feedAndMultiply(_zombieId, kittyDna, "kitty");
    } //end function feedOnKitty()
} //end contract ZombieFeeding{}