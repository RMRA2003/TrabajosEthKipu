// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract Auction {
    address payable public owner; 
    uint public endTime; 
    uint public minIncrement = 5; 

    address public highestBidder;
    uint public highestBid; 

    mapping(address => uint) public bids; 

    event NewBid(address indexed bidder, uint amount);
    event Withdraw(address indexed bidder, uint amount);
    event AuctionExtended(uint newEndTime);
    event AuctionEnded(address winner, uint amount);

    constructor(uint _durationMinutes) {
        require(_durationMinutes > 0, "La duracion debe ser mayor que cero.");
        owner = payable(msg.sender);
        endTime = block.timestamp + (_durationMinutes * 1 minutes);
    }

    modifier onlyBeforeEnd() {
        require(block.timestamp < endTime, "La subasta ha finalizado.");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el propietario puede ejecutar esta funcion.");
        _;
    }

    
    function bid() external payable onlyBeforeEnd {
        require(msg.value > 0, "Debes enviar un valor positivo.");
        uint newBid = bids[msg.sender] + msg.value;
        uint minRequired = highestBid + (highestBid * minIncrement) / 100;

        require(newBid > minRequired, "La oferta debe superar al menos un 5% la actual.");

        bids[msg.sender] = newBid;
        highestBidder = msg.sender;
        highestBid = newBid;

        
        if (endTime - block.timestamp < 5 minutes) {
            endTime += 5 minutes;
            emit AuctionExtended(endTime);
        }

        emit NewBid(msg.sender, newBid);
    }

    
    function withdraw() external {
        require(msg.sender != highestBidder, "El ganador no puede retirar.");
        uint amount = bids[msg.sender];
        require(amount > 0, "No tienes fondos para retirar.");

        bids[msg.sender] = 0;

        uint commission = (amount * 2) / 100;
        uint refund = amount - commission;

        payable(msg.sender).transfer(refund);
        owner.transfer(commission);

        emit Withdraw(msg.sender, refund);
    }

    
    function endAuction() external onlyOwner {
        require(block.timestamp >= endTime, "La subasta no ha finalizado aun.");
        require(highestBid > 0, "No se recibieron ofertas.");

        bids[highestBidder] = 0;
        owner.transfer(highestBid);

        emit AuctionEnded(highestBidder, highestBid);
    }

    
    function getAuctionStatus() external view returns (
        address _owner,
        uint _endTime,
        address _highestBidder,
        uint _highestBid
    ) {
        return (owner, endTime, highestBidder, highestBid);
    }
}
