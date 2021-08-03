pragma solidity ^0.4.24

//Smart Contract Padre
contract Ownable {
    address private owner; //variable de tipo address

    constructor() {
        owner = msg.sender;
    }

    //Creación de un modifier para asegurarnos que solo el propietario puede ejecutar una función
    modifier isOwner() {
        require(owner == msg.sender);
        _;
    }
}