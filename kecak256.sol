// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract hashFunction {
    
    function hash1(string memory _var1, string memory _var2) public pure returns (bytes32)  {
        
        return keccak256(abi.encodePacked(_var1, _var2));
    }


    function hash2(string memory _var3, string memory _var4) public pure returns (bytes32)    {
       
        return keccak256(abi.encodePacked(_var3, _var4));
    }


    // function to get hashes
    function getHash(string memory a, string memory b, string memory c, string memory d) public pure returns (bytes32, bytes32) {
       bytes32 h1 =  hash1(a,b);
       bytes32 h2 = hash2(c,d);
     
        return (h1, h2);
    }
}
