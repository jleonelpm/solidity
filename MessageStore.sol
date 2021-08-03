pragma solidity ^0.4.24;

import "./Ownable.sol"; //Importamos el contrato padre para heredar

//Estuctura de un Smart Contract llamado MessageStore
contract MessageStore is Ownable { //se aplica la herencia con la palabra reservada is
    
    //variables
    string private message; //variable tipo string
        
    //Método público que recibe un argumento de tipo String
    function setMessage1(string newMessage) public isOwner { //Se aplicó elmodificador
        message = newMessage;
    }

    //Método público que recibe un argumento de tipo String
    function setMessage2(string newMessage) public payable { //Se aplicó payable
        require(msg.value == 3 ether); // se deberá ejecutar solamente el valor pagado en ether es 3
        message = newMessage;
    }    
    
    //Método público que retorna un mesaje de tipo string
    function getMessage() public view returns (string) {
        return message;
    }

    
}
