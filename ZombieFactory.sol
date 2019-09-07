pragma solidity ^0.4.25;
import "./Ownable.sol";

contract ZombieFactory is Ownable {
    event NewZombie(uint zombieId, string name, uint dna);
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    uint cooldownTime = 1 days;

    struct Zombie {
        string name;
        uint dna;
        uint32 level;
        uint32 readyTime;
        uint16 winCount;
        uint16 lossCount;
    } //end struct Zombie {}

    Zombie[] public zombies;
    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;

    function _createZombie(string _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna, 1, uint32(now + cooldownTime))) - 1;
        emit NewZombie(id, _name, _dna);
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
    } //end function createZombie()

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str));
        return rand % dnaModulus;
    } //end function _generateRandomDna()

    function createRandomZombie(string _name) internal {
        require(ownerZombieCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    } //end function createRandomZombie()
} //end contract zombiefactory {}

