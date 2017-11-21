pragma solidity ^0.4.0;

contract Complex {
    struct Data {
        uint a;
        bytes32 b;
        mapping (uint => uint) map;
    }
    mapping (uint => mapping(bool => data[])) public data;
}