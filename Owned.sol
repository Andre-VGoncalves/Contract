pragma solidity ^0.4.0;

contract owned {
    function owned() { owner = msg.sender; }
    address owner;
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

}

contract mortal is owned {
    function close() onlyOwner {
        selfdestruct(owner);
    }
}