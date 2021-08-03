pragma solidity ^0.4.24;

//Estuctura de un Smart Contract llamado MessageStore
contract MessageStore {
    
    //variables
    address private owner; //variable tipo addres
    string private message; //variable tipo string
    
    //Constructor en modo publico
    constructor() public {
        
        owner = msg.sender;
        
    }
    
    //Método público que recibe un argumento de tipo String
    function setMessage(string newMessage) public isOwner { //Se aplicó el modificador
        message = newMessage;
    }
    
    //Método público que retorna un mesaje de tipo string
    function getMessage() public view returns (string) {
        return message;
    }

    //Creación de un modifier para asegurarnos que solo el propietario puede ejecutar una función
    modifier isOwner() { 
        require(owner == msg.sender);
        _;
    }
    
}
