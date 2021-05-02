// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "EscrowTetra.sol";


contract EscrowFactory{
    
    mapping (uint => address) public Escrowaddresses;
    uint public addressID;
    
    event EscrowCreated(uint tokenID, uint price, address owner);
    
    constructor() {
        
    }
    
    function getTotalEscrows() public view returns(uint){
        return (addressID);
    }
    
    
    function releaseEscrow(
        uint _tokenID,
        uint price,
        address owner
        ) public{
        require( price>0 , 'Select Correct Version');     
        
    
        Escrow new1 = new Escrow( _tokenID, price, owner);
        addressID += 1;
        Escrowaddresses[addressID] = address(new1);
        
        emit EscrowCreated(_tokenID, price, owner);
        
    }
    
    
}


