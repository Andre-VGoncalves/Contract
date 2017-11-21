pragma solidity ^0.4.0;

contract OwnedToken {

    TokenCreator creator;
    address owner;
    bytes32 name;

    function OwnedToken (bytes32 _name) {

        owner = msg.sender;
        creator = TokenCreator(msg.sender);
        name = _name;

    }

    function changeName (bytes32 newName) {
        if (msd.sender == address(creator)) {
            name = newName;
        }
    }

    function transfer (address newOwner) {
        if (msg.sender != owner) { 
            return;
        }
        
        if (creator.isTokenTransferOk(owner, newOwner)) {
            owner = newOwner;
        }
    }
}



contract TokenCreator {

    function createToken(bytes32 name)
        returns (OwnedToken tokenAddress)
    {
        return new OwnedToken(name);
    } 

    function changeName (OwnedToken tokenAddress, bytes32 name) {
        tokenAddress.changeName(name);
    }

    function isTokenTransferOk(address currentOwner,address newOwner) returns (bool ok) {
        address tokenAddress = msg.sender;
        return (keccak256(newOwner) & 0xff) == (bytes32(tokenAddress) & 0xff);
    }
}

