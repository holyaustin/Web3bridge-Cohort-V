// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract hashing {

    function firstFunction(address _var1, address _var2, address _var3) public pure returns (bytes32)  {

        bytes32 stepOne= keccak256(abi.encodePacked(_var1, _var2));
        bytes32 stepTwo= keccak256(abi.encodePacked(stepOne, _var3));
        
        return stepTwo;
    }

    function secondFunction(address a, address b, address c, uint _num, bytes32 _b32) public pure returns (bytes32)    {
        
        bytes32 firstHashValue =  firstFunction(a,b,c);
        bytes32 numHash = keccak256(abi.encodePacked(_num));
        bytes32 b32Hash = keccak256(abi.encodePacked(uint(_b32)));
        
        return keccak256(abi.encodePacked(numHash, b32Hash, firstHashValue));
    }

} 
//Your contract is supposed to contain a very CRUCIAL function . Your first function accepts 3 different addresses and performs 
//the keccak256 hash of the first 2....it then hashes the result with the third address and returns the final hash...
//The second CRUCIAL function gets the final hash from the first function above and accepts two arguments(a number and 
//a bytes32 value)...it hashes the number separately, performs a typecasting(on the bytes32[second argument]) so as to convert 
//it to a number, hashes the number too, then hashes both of the resulting hashes with the hash gotten from the previous function 
//and finally returns the final hash. Note: Use the correct function visibility specifiers
//0x3e1b079f000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb2000000000000000000000000ab8483f64d9c6d1ecf9b849ae677
//dd3315835cb2000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb2000000000000000000000000000000000000000000000000000
//00000000000020000000000000000000000000000000000000000000000000000000000000043
