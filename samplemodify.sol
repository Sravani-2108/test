pragma solidity ^0.4.0;
contract sample
{
     string public symbol;
    string public name;
    uint public decimals;
    uint public totalSupply;
    address owner;
    mapping(address=>uint) balance;
    mapping(address => mapping(address => uint)) alowed;
   
    
    function sample() public payable
    {
        owner=msg.sender;
        symbol="BS";
        name="Sra";
        decimals=18;
        totalSupply=10000;
        balance[owner]=totalSupply;
        
    }
    
    modifier onlyOwner(){
        if(msg.sender!=owner){
            revert();
        }
        _;
    }
function transfer(address _to,uint amnt) public returns(bool)
{
     require(owner!=_to && amnt>0);
    balance[_to]+=amnt;
    balance[owner]-=amnt;
    return true;
}
function mint(uint256 amnt)  public returns(bool)
{
require(totalSupply>amnt);
{
    balance[owner]+=amnt;
    return true;
}
}
 function approve(address spender, uint amnt) public returns (bool)
     {
        require(owner != spender && amnt>0);
        alowed[owner][spender] = amnt;
      
        return true;
    }
    function allowance(address owner, address spender) public constant returns (uint)
    {
        require(owner != spender);
        return alowed[owner][spender];
    }
    function transferFrom(address owner,address _to,uint amnt) public returns(bool)
    {
         if (balance[owner] >= amnt && amnt > 0 && alowed[owner][_to] >= amnt)
         {
             balance[owner] -= amnt;
             balance[_to] += amnt;
             alowed[owner][_to] -= amnt;
             return true;
         }
         else
         {
             return false;
         }
     }
function balanceOf(address _add) public constant returns(uint256)
{
    return (balance[owner]);
}
}
