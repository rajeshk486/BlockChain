pragma solidity >=0.4.22 <0.6.0;

contract MyfirstContract {
    int[3][3] board;
    string public winner_game;
    address player1; address player2;
    constructor() public{
        player1=msg.sender;
    }
   function joinplayer2()public
   {
       player2=msg.sender;
   }
   
   function sendplayers() view public returns(address[] memory ) 
   {
       address[]memory temp;
       temp[0]=player1;
       temp[1]=player2;
       
       return temp;
   }
   
   function sendboard()view public returns(int[3][3] memory)
   {
       return board;
   }
   
function makemove(int player_number,uint8 x,uint8 y)public returns(string memory)
{
    /*string storage  m=whowonthegame();
    if(keccak256(whowonthegame())==keccak256(""))
    return "Match Draw!";*/
    
    if(board[x][y]!=0)
    return "already occupied";
    
        if(player_number ==1)
            board[x][y]=1;
        else
          board[x][y]=2;
    return "Move made successfully";
}
function whowonthegame() public returns(string memory)
{
    int winner = checksuccess();
    if(winner ==1)
        winner_game= "Player1 won the game";
    else if(winner ==2)
        winner_game= "Player2 won the game";
    else if(winner ==3)
    winner_game="Match Draw";
    else
    winner_game= "Match is going on";
    
    return winner_game;
}

/*
returns 1== player1 won
2== player2 won
3==draw Match
4==match is going on
*/
function checksuccess()public view returns(int)
{
    //check row
    for(uint i=0;i<3;i++)
        if(board[i][0]==1 && board[i][1]==1 && board[i][2]==1 )
        return 1;
        else if(board[i][0]==2 && board[i][1]==2 && board[i][2]==2 )
        return 2;
        
    //check column
    for(uint i=0;i<3;i++)
        if(board[0][i]==1 && board[1][i]==1 && board[2][i]==1 )
        return 1;
        else if(board[0][i]==2 && board[1][i]==2 && board[2][i]==2 )
        return 2;
        
    //check column
    for(int i=1;i<3;i++)
    {
    if(board[0][0]==i && board[1][1]==i && board[2][2]==i)
    return i;
    if(board[0][2]==i && board[1][1]==i && board[2][0]==i)
    return i;
    }   
    
    //check for draw condition
    int board_map=0;
    for(uint i=0;i<3;i++)
    for(uint j=0;j<3;j++)
    {
        if(board[i][j]!=0)
            board_map++;
    }
    if(board_map==9)
        return 3;
    return 4;
}       

}
