// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract MyErc721 is ERC721{
    uint count = 0;

    struct Token721{
        address creator;
        string name;
        string ipfsHash;
    }
    
    mapping (uint => string) internal passwords;
    
    Token721[] public tokenss;

    constructor() ERC721('Tetra','TET')  {
    }
    
    function getCreator(uint _tokenID) public view returns(address){
        return tokenss[_tokenID-1].creator;
    }
    
    function getPassword(uint _tokenID) public view returns(string memory){
        require(ownerOf(_tokenID)==msg.sender);
        return passwords[_tokenID];
    }
 
    function award(string memory _name, string memory _ipfsHash, string memory _password, address _to) public {
        count++;
        tokenss.push(Token721(_to,_name,_ipfsHash));
        passwords[count] = _password;
        _mint(_to,count);
        
    }
    

}