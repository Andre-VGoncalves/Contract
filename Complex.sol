pragma solidity ^0.4.0;

contract Complex {
    struct Data {
        uint a;
        bytes3 b;
        mapping (uint => uint) map;
    }
    mapping (uint => mapping(bool => data[])) public data;
    
    function data (uint arg1, bool arg2, uint arg3) returns (uint a, bytes3 b) {
        a = data[arg1][arg2][arg3].a;
        b = data[arg1][arg2][arg3].b;
    } 
}