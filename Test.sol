pragma solidity ^0.4.0;

contract Test {
    function() { x = 1; }
    uint x;
}

contract Sink {
    function() payable { }
}

contract Caller {
    function callTest (Test test) {
        test.call(0xabcdef01);
    }
}