// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "tetra.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/utils/ERC721Holder.sol";


contract Escrow is ERC721Holder{
    uint public tokenID ;
    address FeeAddress = 0x83Acc100cEf4d52F700014d62626c32EC32DCEa3;
    address public tokenOwner ; 
    address public tokenBuyer ;
    uint public price;
    bool public tokenSet=false;
    MyErc721 TetraNFT = MyErc721(0x835beeEa762Ad5bc30ab1dD038e58b192e31DfB5);
    
    constructor(uint _tokenID, uint _price, address _owner) {
        tokenID = _tokenID;
        tokenOwner = _owner;
        price = _price;
        
    }
    
    function depositNFT() public{
        require(msg.sender == tokenOwner);
        TetraNFT.safeTransferFrom(msg.sender, address(this), tokenID);
        tokenSet = true;
    }
    
    function withdrawNFT() public{
        require(msg.sender == tokenOwner);
        TetraNFT.safeTransferFrom(address(this), msg.sender , tokenID);
        tokenSet = false;
    }
    
    function payEther() public payable{
        require(msg.value>= price);
        require(tokenID>0);
        require(tokenSet==true);
        tokenBuyer = msg.sender;
        uint priceAmount = (97*price)/100;
        uint feeAmount = (3*price)/100;
        payable(tokenOwner).transfer(priceAmount);
        payable(FeeAddress).transfer(feeAmount);
        TetraNFT.safeTransferFrom(address(this),msg.sender, tokenID);
        
    }
    
    function withdrawPayment() public{
        require(address(this).balance>0);
        require(msg.sender==tokenBuyer);
        payable(tokenBuyer).transfer(address(this).balance);
        
    }
    
    
    
    receive() external payable { }
}