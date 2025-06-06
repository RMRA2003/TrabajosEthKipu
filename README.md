Smart Contract - Auction
This is a Solidity smart contract for an auction deployed on the Sepolia test network. Users can place bids with Ether (ETH), and the highest valid bid wins. The contract handles time extensions, refunds, and keeps track of each bid.

Features
Constructor: Sets the auction duration (in minutes) and the contract owner.

Bid (ofertar)
Bids must be at least 5% higher than the current best bid.
If a valid bid is placed during the last 10 minutes of the auction, the auction is extended by 10 more minutes.

View Winner (verGanador)
Returns the current highest bidder and the amount of their bid.

View Bids (verOfertas)
Returns the list of all bidders and the total amount each one has offered.

Finalize Auction (finalizarSubasta)
Can only be called by the owner after the auction ends.
Non-winning bidders are refunded their deposits with a 2% fee deducted.

Partial Refund (reembolsoParcial)
If a user placed more than one bid, they can request a refund for all previous bids, keeping only the last one.

Security
Critical functions are protected using modifiers such as soloDueño, soloDuranteSubasta, and noFinalizada.

ETH funds are held safely within the contract and are only returned under validated conditions.

require statements ensure valid usage and prevent unexpected behavior.

Events
solidity
Copiar
Editar
event NuevaOferta(address ofertante, uint monto);
event SubastaFinalizada(address ganador, uint monto);
These events are emitted when a new bid is placed and when the auction is finalized.

How to Deploy (Sepolia Testnet)
Go to Remix IDE

Create a new file named Subasta.sol and paste the contract code.

Compile the contract using Solidity version 0.8.20 or higher.

Connect MetaMask to the Sepolia testnet.

Deploy the contract by setting the auction duration in minutes (e.g., 15).

After deployment, copy the contract address.

Go to Sepolia Etherscan, search for your contract address, and verify the source code.

Notes
The auction duration must be greater than 10 minutes.

Only one winner is selected (the highest valid bid).

All bids are recorded and can be viewed.

Bidders can recover previous bids if they placed more than one.

You must have ETH in your wallet from a Sepolia faucet to test the contract.
