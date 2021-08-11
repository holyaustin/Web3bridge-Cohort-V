// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

// A Street has 4 houses,each containing 6 flats that contains 5 rooms each

contract street {
    
    uint house = 4;
    uint flat = 6;
    uint room = 5;
    uint[] persons;
    
    function totalNumber () public view returns (uint, uint, uint[] memory) {
       uint totalFlats = house * flat;
       uint totalRooms = totalFlats * room;
       //totalOccupants is not possible because from the question we are using a dynamic array.
       //as declared in line 11 above
       return (totalFlats, totalRooms, persons);
     }

}
 
