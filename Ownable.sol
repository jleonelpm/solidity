pragma solidity ^0.4.24

//Smart Contract Padre
contract Ownable {

    //variable de tipo address.
    // Se cambio la visibilidad private a internal (protected en otros lenguajes)
    address internal owner; 

    constructor() {
        owner = msg.sender;
    }

    //Creación de un modifier para asegurarnos que solo el propietario puede ejecutar una función
    modifier isOwner() {
        require(owner == msg.sender);
        _;
    }
}