# Smart Contract - Auction

This is a smart contract for an auction on the Sepolia test network. It allows multiple users to place bids and selects a winner based on the highest valid bid.

## 📦 Features

- **Constructor:** Sets the auction duration in minutes.
- **Bid:** Bids must be at least 5% higher than the current highest bid. If a valid bid is made in the last 10 minutes, the auction extends by 10 more minutes.
- **View Winner:** Shows the highest bidder and their bid amount.
- **View Bids:** Returns a list of bidders and how much they offered.
- **Finalize Auction:** Only the owner can finish the auction. Non-winners get their deposits back with a 2% fee.
- **Partial Refund:** Bidders can get a refund of their previous bids if they placed multiple bids.

## ⚠️ Security

- Uses `require` to validate important rules.
- Access to important functions is restricted using `modifiers`.
- Funds are safely stored in the contract and refunded when needed.

## 📢 Events

- `NewBid(address bidder, uint amount)`
- `AuctionEnded(address winner, uint amount)`

## 🚀 How to Deploy

1. Use [Remix IDE](https://remix.ethereum.org/)
2. Paste the contract in a file called `Auction.sol`
3. Compile the contract with Solidity ^0.8.20
4. Connect your wallet (MetaMask) with Sepolia testnet
5. Deploy the contract and set the duration (e.g., 15 minutes)
6. Copy the contract address and verify it on [Sepolia Etherscan](https://sepolia.etherscan.io/)
7. Publish the source code from Remix to make it verified

## 📝 Notes

- Only one winner (the highest bidder).
- The auction must last more than 10 minutes.
- All bids are stored and can be reviewed.
- You must add ETH to your wallet from a faucet before testing.
