# NFT Minting and Word Changing Project

## Overview

This project is a simple Solidity-based application that facilitates the minting of NFTs (Non-Fungible Tokens) and allows users to change the words associated with each minted NFT. It is developed using Hardhat, a development environment for Ethereum smart contracts, and Solidity, a programming language for writing smart contracts on the Ethereum blockchain.

## Features

1. **NFT Minting**: Users can mint their own unique NFTs on the Ethereum blockchain. Each minted NFT is distinct and has a unique identifier.

2. **Word Changing**: Once an NFT is minted, users have the ability to change the associated words or content of the NFT. This feature adds a dynamic and customizable element to each NFT.

## Getting Started

Follow these steps to get the project up and running:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/nft-word-changing.git
   cd nft-word-changing
   ```

2. **Install Dependencies:**
   ```bash
   npm install
   ```

3. **Compile Smart Contracts:**
   ```bash
   npx hardhat compile
   ```

4. **Run Local Ethereum Node:**
   ```bash
   npx hardhat node
   ```

5. **Deploy Smart Contracts:**
   ```bash
   npx hardhat run scripts/deploy.js --network localhost
   ```

6. **Interact with the DApp:**
   - Open your web browser and connect to a local Ethereum wallet (e.g., MetaMask).
   - Visit the DApp frontend (provide link if applicable) to mint NFTs and change associated words.

## Smart Contracts

The project includes the following main smart contract files:

- **`MyEpicNFT.sol`**: Contains the logic for NFT minting and word changing.

## Contributing

Contributions are welcome! If you'd like to contribute to the project, please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and ensure they pass the tests.
4. Submit a pull request.


