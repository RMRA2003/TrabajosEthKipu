# Smart Auction Contract (Sepolia Network)

This project is a smart auction contract written in Solidity and deployed to the Sepolia Ethereum testnet. It allows users to place bids with automatic bid management, winner tracking, and partial refunds. The contract includes security features, time extensions, and commission-based reimbursements.

## Features

- Auction creation with customizable duration.
- Bids with a minimum increment of 5%.
- Tracks the current highest bidder and bid amount.
- Partial refunds for non-winning bidders with a 2% commission.
- Automatic extension of auction time if a bid is placed near the end.
- Winner can be consulted after the auction ends.
- Transparent and verifiable on Sepolia Etherscan.

## Smart Contract

- **Address**: [`0xb6f479784338358d8cab3cfcd3193e84f87a23bb`](https://sepolia.etherscan.io/address/0xb6f479784338358d8cab3cfcd3193e84f87a23bb)
- **Network**: Sepolia Testnet
- **License**: GPL-3.0

## Technologies Used

- Solidity (`^0.8.19`)
- Remix IDE
- MetaMask (for deployment)
- Git & GitHub
- Etherscan (for verification)

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-repo.git
s
