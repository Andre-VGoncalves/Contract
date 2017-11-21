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

contract priced {
    modifier costs (uint price){
        if (msg.value >= price){
            _;
        }
    }
}

contract register is priced, owned {
    mapping (address => bool) registeredAddress;
    uint price;

    function Register() payble costs(price) {
        registeredAddress[msg.sender] = true;
    }

    function changePrice (uint _price) OnlyOwner {
        price = _price;
    }
}

contract Mutex {
    bool locked;
    modifier noReentrancy() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    function f() noReentrancy returns (uint) {
        require(msg.sender.call());
        return 7;
    }
}





