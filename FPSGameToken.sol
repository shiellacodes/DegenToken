// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract FPSGameToken is ERC20, Ownable {

    enum FPSItemType { None, Ammo, Armor, ArmorHelmet }

    struct FPSItem {
        string itemName;
        uint256 itemCost;
        uint256 itemQuantity;
    }

    mapping(address => uint256) public userInventory;
    FPSItem[] public fpsItems;  // Available items for purchase

    constructor() ERC20("FPSGameToken", "FGT") {
        fpsItems.push(FPSItem("Ammo", 1, 100));         // 10 tokens for 1 Ammo
        fpsItems.push(FPSItem("Armor", 2, 50));    // 30 tokens for 1 Armor
        fpsItems.push(FPSItem("ArmorHelmet", 3, 20));  // 50 tokens for 1 Armor + Helmet
    }

    // Mint new tokens for the given address (owner only can call this function)
    function createTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Burn tokens from the caller's account
    function burnTokens(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Transfer tokens from one address to another
    function transferTokens(address to, uint256 amount) public returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    // Returns the number of available items in the game
    function getItemCount() public view returns (uint256) {
        return fpsItems.length;
    }

    // Function to purchase a specific item (ammo, health, boost) using the tokens
    function purchaseItem(uint256 index) public {
        uint256 adjustedIndex = index - 1;

        require(adjustedIndex < fpsItems.length, "Invalid item index");
        require(balanceOf(msg.sender) >= fpsItems[adjustedIndex].itemCost, "Not enough tokens to buy item");
        require(fpsItems[adjustedIndex].itemQuantity > 0, "Item out of stock");

        userInventory[msg.sender] += 1;
        fpsItems[adjustedIndex].itemQuantity -= 1;  // Decrease available quantity of the item
        _burn(msg.sender, fpsItems[adjustedIndex].itemCost);  // Burn tokens to pay for the item
    }


    // Function to check the inventory of a player
    function getInventory() public view returns (uint256) {
        return userInventory[msg.sender];
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

}
