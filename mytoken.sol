// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address private _owner;

    // Constructor to initialize the token with the name "MyToken" and symbol "MTK"
    // The contract deployer is set as the owner and is initially minted 1,000,000 tokens
    constructor() ERC20("MyToken", "MTK") {
        _owner = msg.sender;
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Modifier to restrict functions to the contract owner
    modifier onlyOwner() {
        require(msg.sender == _owner, "Caller is not the owner");
        _;
    }

    // Function to mint new tokens (only the owner can do this)
    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    // Overridden transfer function to transfer tokens
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    // Function to burn tokens (anyone can do this)
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
