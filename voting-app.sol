// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Timers.sol";

contract ClearProject is Ownable
{
    //Variables
    uint16 public totalVotos;
    int id;
    struct Votante
    {
        bool voto;
        bool puedeVotar;
    }
    struct Candidata
    {
        uint8 id;
        string nombre;
        uint256 votos;
     // uint256 direccionVotante;
    }
    enum StatusVotacion { Started, Ended }
	StatusVotacion public statusVotacion;

    address[] public conjuntoVotantes;
    mapping(address => Votante) votanteMapping;

    event voterAdded(address voter);
    event votingStarted();
    event votingEnded();
    event votingDone(address voter);

    Candidata public candidata1 = Candidata(
        {
            id: 1,
            nombre: "Zoe Hernandez",
            votos: 0
        }
    );
    Candidata public candidata2 = Candidata(
        {
            id: 2,
            nombre: "Tania Geuna",
            votos: 0
        }
    );
    Candidata public candidata3 = Candidata(
        {
            id: 3,
            nombre: "Lorena Vazquez",
            votos: 0
        }
    );
    

     //Funciones
     //Darle permiso a alguien de votar

    uint public constant VOTING_PERIOD = 7 days;

     function startVoting() public onlyOwner returns (bool,StatusVotacion status) {
        statusVotacion = StatusVotacion.Started;
        emit votingStarted();
        return (true, StatusVotacion.Started);
     }

    function finishVoting() public onlyOwner returns (bool,StatusVotacion status) {
        statusVotacion = StatusVotacion.Ended;
        emit votingEnded();
        return (true, StatusVotacion.Ended);
     }
    
        modifier validId(uint8 _id) {
            require (_id < 4, "Assign candidate from 1 to 3");
            require (_id > 0, "Assign candidate from 1 to 3");
            _;
        }

        function permisoVotar(address _votante) public onlyOwner returns(bool, address)
        {
        votanteMapping[_votante].puedeVotar = true;
        votanteMapping[_votante].voto = false;
        emit voterAdded(_votante);
        return (true, _votante);
        }

        function assignCandidate(uint8 _id, string memory _nombre) public onlyOwner validId(_id) returns(bool, string memory) {
            require (_id < 4, "Assign candidate from 1 to 3");
            require (_id > 0, "Assign candidate from 1 to 3");
            Candidata memory newCandidate = Candidata({
                id: _id,
                nombre: _nombre,
                votos: 0
            });
            if (_id == 1) {
                candidata1 = newCandidate;
            } else if (_id == 2) {
                candidata2 = newCandidate;
            } else if (_id == 3) {
                candidata3 = newCandidate;
            }
            return (true, _nombre);
        }

     // votar - solo los ejecutan los votantes con permiso
        // Si la wallet que esta votando, tiene "puedeVotar" en true, entoces vota, sino "No puede votaR"
        
        modifier canVote() {
            require(votanteMapping[msg.sender].puedeVotar == true, "No estas autorizado votar");
            require(votanteMapping[msg.sender].voto == false, "No puedes votar mas de una vez");
            require(statusVotacion == StatusVotacion.Started, "La votacion esta cerrada");
            _;
        }

        function votar(uint8 _candidataId) public canVote validId(_candidataId) returns(bool success, string memory message, string memory nombre )
        {
            votanteMapping[msg.sender].voto = true;
            conjuntoVotantes.push(msg.sender);
            totalVotos++;
            emit votingDone(msg.sender);
            if(_candidataId == 1)
            {
            //votas por Candidata 1
            candidata1.votos += 1;
            return (true, "Votaste por", candidata1.nombre);
            }
            if(_candidataId == 2) 
            {
            //votas por Tania
            candidata2.votos += 1;
            return (true, "Votaste por", candidata2.nombre);
            }
            //Votas por Lorena
            if (_candidataId == 3)
            {
            candidata3.votos += 1;
            return (true, "Votaste por", candidata3.nombre);
            }
           
        }
       //Comprobar si puede votar
        function puedoVotar() public view returns (string memory messaje)
        {
            if (votanteMapping[msg.sender].voto == true)
            {
                return ("No puedes votar mas de una vez");
            } else if (votanteMapping[msg.sender].puedeVotar != true) {
                return ("No estas autorizado a votar");
            }
            else
            {
                return ("Puedes votar");
            }
        }

        function getWinner() public view onlyOwner returns (string memory winner, uint votos, address contrato){
            Candidata memory winnerCandidate;
            if(candidata1.votos > candidata2.votos && candidata1.votos > candidata3.votos) {
                winnerCandidate = candidata1;
            }
            else if(candidata2.votos > candidata1.votos && candidata2.votos > candidata3.votos) {
                winnerCandidate = candidata2;
            } 
            else if(candidata3.votos > candidata1.votos && candidata3.votos > candidata2.votos) {
                winnerCandidate = candidata3;
            } else {
               return ("No winner, there is a tie", 0, address(this));
            }
            return (winnerCandidate.nombre,winnerCandidate.votos, address(this));
        }

        function resetVoters() private onlyOwner {
            for (uint i=0; i< conjuntoVotantes.length ; i++){
                votanteMapping[conjuntoVotantes[i]] = Votante({puedeVotar: false, voto: false});
            }
            totalVotos = 0;
        }
    
}
