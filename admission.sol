// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
contract studentAdmission {
    address public owner;
    uint256 amount;
    uint256 public admissionCharge;
    uint256 public counter;
    event changedScore( uint c, uint d); 
    event studentAdded(string w, string x, uint256 y, uint256 z);
    event Sent(address from, address to, uint amount);
    
    mapping (uint256 => student) students;
    mapping(address => uint256) balances;
     // An address type variable is used to store ethereum accounts.
    struct student {
        string fName;
        string lName;
        uint256 regNo;
        uint256 score;
    }

    constructor() {
        balances[msg.sender] = 500000;
        owner = msg.sender;
        admissionCharge = 2;
    }
  modifier onlyOwner()   {
    require(isOwner(),
    "Function accessible only by the owner !!");
    _;
  }
  function isOwner() public view returns(bool) 
  {
    return msg.sender == owner;
  }
    function register (string memory _fName, string memory _lName,  uint256 _score ) public  {
        transferCharge();//collect Charge first to avoid reentrancy expliot.
       // studentData[] memory st;
        counter++;
        students[counter] = student(_fName, _lName, counter, _score);

        //emit playerAdded(p.playerName, p.playingNo, p.position);
        emit studentAdded (_fName, _lName, counter, _score);
        }
     
    function getStudent(uint256 _regNo) public view returns (string memory,string memory,uint256,uint256) {
        string memory _fName = students[_regNo].fName;
        string memory _lName = students[_regNo].lName;
        uint256 _regNo2 = students[_regNo].regNo;
        uint256 _score = students[_regNo].score;
        return (_fName, _lName, _regNo2, _score);
 
    }

        
    function editStudentScore(uint256 _sregNo, uint256 _latest) public onlyOwner {
        //require(msg.sender == owner);
        uint256 prevScore = students[_sregNo].score; 
        students[_sregNo].score = _latest;   
        emit changedScore (prevScore, _latest);
    }
    function countstudents() public view  returns (uint) {
        return counter;
    }
    function mint(address receiver, uint _amount) public {
        require(msg.sender == owner);
        balances[receiver] += _amount;
    }
    function transferCharge() internal {
        require(balances[msg.sender] >= admissionCharge, "Not enough tokens for pay your Admission Charge");
        balances[msg.sender] -= admissionCharge;
        balances[owner] += admissionCharge;
       //emit Sent(balances[msg.sender], balances[owner], admissionCharge);
    }
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

}
