pragma solidity ^0.4.0;

contract C {

    uint private data;
    uint constant x = 32**22 + 8;
    string constant text = "abc";
    bytes32 myhash = keccak256("abc");

    function f (uint a, uint b) pure returns (uint) { return a * (b + 42); }
    function setData (uint a) { data = a; }
    function getData() public returns(uint) { return data; }
    function compute (uint a, uint b) internal returns (uint) { return a + b; }

}

contract D {

    function readData() {
        C c = new C();
        uint local = c.f(7);
        c.setData(3);
        local = c.getData();
        local = c.setData(3,5);
    }
}

contract E is C {
    function g() {
        C c = new C();
        uint val = compute(3,5);
    }
}

/*contract Caller {
    C c = new C();
    function f() {
        uint local = c.data;
    }
}*/

