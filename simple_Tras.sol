contract SimpleBank {
    uint8 private clientCount;
    mapping (address => uint) private balances;
    address public owner;

constructor() public payable
{
    require(msg.value == 30 ether, "30 ether initial funding required");
    owner =msg.sender;
    //msg.sender.transfer(10 ether);
}

function enroll() public returns (uint) {
        if (clientCount < 3) {
            clientCount++;
            balances[msg.sender] = 10 ether;
        }
        return balances[msg.sender];
    }

function withdraw(uint withdrawAmount) public returns (uint remainingBal) {
        balances[msg.sender] += 10 ether;
        msg.sender.transfer(10 ether);
        return balances[msg.sender];
    }
    
 function depositsBalance() public  returns (uint) {
        return address(this).balance;}
}