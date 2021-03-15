pragma solidity ^0.4.17;

contract Campaing {
    //definition for the struct - This struct represents a general object for a payment request
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
    }

    address public manager;
    Request[] public requests;
    uint public minimumContribution;
    address[] public approvers;

    //modifier to strict the use of some functions
    modifier restricted(){
        require(msg.sender == manager);
        _;
    }

    //creates a campaign
    function Campaing(uint minimum) public {
        manager = msg.sender;
        minimumContribution = minimum;
    }

    function contribute() public payable {
        require(msg.value > minimumContribution);
        approvers.push(msg.sender);
    }
}