pragma solidity ^0.4.25;
import "./ZombieFactory.sol";

contract KittyInterface {
  
} //interface to call getKitty() from cryptokitty's contract

contract ZombieFeeding is ZombieFactory {

    function feedAndMultiply(uint _zombieId, uint _targetDna) public {
      require(msg.sender == zombieToOwner[_zombieId]);
      Zombie storage myZombie = zombies[_zombieId];
      _targetDna = _targetDna % dnaModulus;
      uint newDna = (myZombie.dna + _targetDna)/2;
      _createZombie("NoName", newDna);
    } //end function feedAndMultiply()
} //end contract ZombieFeeding{}