contract SimpleBank {
    uint8 private clientCount;
    mapping (address => uint) private balances;
    address public owner;

    event LogDepositMade(address indexed accountAddress, uint amount);
    constructor() public payable {
        require(msg.value == 30 ether, "30 ether initial funding required");
        owner = msg.sender;
        clientCount = 0;
        msg.sender.transfer(10 ether);
    }

    function enroll() public returns (uint) {
        if (clientCount < 3) {
            clientCount++;
            balances[msg.sender] = 10 ether;
        }
        return balances[msg.sender];
    }

    
    function deposit() public payable returns (uint) {
        balances[msg.sender] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        return balances[msg.sender];
    }


    function withdraw(uint withdrawAmount) public returns (uint remainingBal) {
        if (withdrawAmount <= balances[msg.sender]) {
            balances[msg.sender] -= withdrawAmount;
            msg.sender.transfer(withdrawAmount);
        }
        return balances[msg.sender];
    }

    function balance() public  returns (uint) {
        return balances[msg.sender];
    }

    /// @return The balance of the Simple Bank contract
    function depositsBalance() public  returns (uint) {
        return address(this).balance;
    }
}