pragma solidity ^0.4.0;
contract sample
{
     string public symbol;
    string public name;
    uint public decimals;
    uint public totalSupply;
    address owner;
    mapping(address=>uint) balance;
   
    
    function sample() public payable
    {
        owner=msg.sender;
        symbol="BS";
        name="Sra";
        decimals=0;
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
function balanceOf(address _add) public constant returns(uint256)
{
    return (balance[owner]);
}
}
