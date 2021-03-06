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
    //Para ejecutar este método de manera obligatoria hay que realizar un pagto de 3 ether
    function setMessage2(string newMessage) public payable { //Se aplicó payable
        require(msg.value == 3 ether); // se deberá ejecutar solamente el valor pagado en ether es 3
        message = newMessage;
    }    
    
    //Método público que retorna un mesaje de tipo string
    function getMessage() public view returns (string) {
        return message;
    }

    //Función que retorna el balance por defecto se devuelve en la unidad wei    
    function getBalance() public view returns (uint){
        return address(this).balance;
    }

    //Función que retorna el balance por defecto se devuelve en la unidad ether    
    function getBalanceInEther() public view returns (uint){
        return getBalance / 1e18; 
    }

    //Función para realizar una transferencia del balance a la cuenta del owner
    function transfer(uint amount) public isOwner {
        require(addres(this).balance >= amount);  
        owner.transfer(amount);
    }

    function transferTo(uint amount, address to) public isOwner {
        require(addres(this).balance >= amount);  
        requiere(to != address(0)); //La dirección introducida debe ser válida para ethereum
        to.transfer(amount); //Realizamos la transferencia a la dirección indicada
    }

    
}
