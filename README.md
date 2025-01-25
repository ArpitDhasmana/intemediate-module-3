# MyToken Smart Contract

## Overview  

MyToken is an ERC20-based token with custom minting and burning functionalities. This smart contract allows the owner to mint tokens, and users to transfer and burn tokens.

## Features

- **Minting Tokens:** Only the contract owner can mint new tokens.
- **Transferring Tokens:** Any user can transfer tokens.
- **Burning Tokens:** Any user can burn their own tokens.

## Contract Details

### MyToken.sol

This contract implements the following features:

1. **Minting Tokens:**
    - Function: `mint(address account, uint256 amount)`
    - Only the contract owner can mint new tokens.
    - The `onlyOwner` modifier ensures that only the owner can call this function.

2. **Transferring Tokens:**
    - Function: `transfer(address recipient, uint256 amount)`
    - Any user can transfer tokens.
    - This function overrides the inherited `transfer` function from the `ERC20` contract.

3. **Burning Tokens:**
    - Function: `burn(uint256 amount)`
    - Any user can burn their own tokens.

### Constructor

- Initializes the ERC20 token with the name "MyToken" and symbol "MTK".
- Sets the deployer of the contract as the owner.
- Mints an initial supply of 1,000,000 tokens to the owner.

## Installation

1. Install dependencies (if using a development framework like Truffle or Hardhat):
   ```sh
   npm install @openzeppelin/contracts
   ```

2. Compile the contract:
   ```sh
   npx hardhat compile
   ```

3. Deploy the contract to the desired network:
   ```sh
   npx hardhat run scripts/deploy.js --network <network_name>
   ```

## Usage

### Minting Tokens

Only the contract owner can mint new tokens:

```solidity
function mint(address account, uint256 amount) public onlyOwner
```

### Transferring Tokens

Any user can transfer tokens using the standard ERC20 `transfer` function:

```solidity
function transfer(address recipient, uint256 amount) public override returns (bool)
```

### Burning Tokens

Any user can burn their own tokens:

```solidity
function burn(uint256 amount) public
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
