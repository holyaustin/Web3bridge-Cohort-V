//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

interface IC {
    function details(string memory _custName) external returns (bytes4 );
    function setApproval(address[] memory  _approve) external;
    function getOwners() external view returns (address[] memory);
}


contract oneSetter is IC {
    string public custName;
    uint256 public regTime; 
    address public approved;
    address public admin = msg.sender;
    address[] public approveList;
    mapping(address => bool) public approveByAddress;
    bytes4 public publicIdentifier;
    event SetApprover(address[] approveList);
   
    event addAprrover(address indexed addAprrover, address indexed _newApprover);
    event removeApprover(address indexed _oldApprover);

    modifier onlyAdmin {
        require(msg.sender == admin);
        _;
    }
      function setApproval(address[] memory  _approve) public override{
        require(msg.sender == approved);
        callEvent(_approve);
    }
    function callEvent(address[] memory _o) internal {
        for(uint256 i = 0; i < _o.length; i++) {
            approveByAddress[_o[i]] = false;
        }

        for(uint256 j = 0; j < _o.length; j++) {
           approveByAddress[_o[j]] = true;
        }
        approveList =_o;
        emit SetApprover(_o);
    }
    function details(string memory _custName) public override returns (bytes4 ){
        custName = _custName;
        regTime = block.timestamp;
        publicIdentifier = bytes4(keccak256(abi.encodePacked("custName, regTime")));
        return publicIdentifier;
    }
        function getOwners() public override view returns (address[] memory) {
             return approveList;
    }
  
}
   
contract twoGetter{
    address private addressOneSetter;
    function setacontractadd(address _a) public {
        addressOneSetter = _a;
    }
    function getCustomer(string memory _a) public returns (bytes4) {
        oneSetter os = oneSetter(addressOneSetter);
        return os.details(_a);
    }

}
