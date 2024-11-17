# DegenToken
Building on Avalanche - ETH + AVAX

## Description
FPSGameToken is an ERC20 token designed for an FPS (First-Person Shooter) game where players can use tokens to purchase in-game items like Ammo, Armor, and Armor Helmet. This contract also allows token minting, burning, and transferring between players.

###Features
ERC20 Token: A token standard that allows players to transfer and store FPSGameTokens (FGT).
In-Game Items: Players can buy items such as Ammo, Armor, and Armor Helmet using tokens.
Inventory System: Tracks player inventory (how many items they have).


## Getting Started
### Executing Program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:
https://github.com/shiellacodes/DegenToken.git

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile FPSGameToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Enter your owner's account and an Initial token value from the dropdown menu, and then click on the "Deploy" button.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Contract Functions
1. **Mint Tokens**
  - This function can only be called by the contract owner.
  - Used to create new tokens and assign them to players.
3. **Burn Tokens**
  - Burns a specified amount of tokens from the caller's balance.
4. **Transfer Tokens**
  - Players can transfer tokens to other players by calling this function.
5. **Get Available Items**
  - Used to check how many types of items are available for purchase.
6. **Purchase Item**
  - The index of the item starts from 1 (1 = Ammo, 2 = Armor, 3 = Armor Helmet).
  - Players need to have enough tokens to buy the item, and the item must be in stock.
  - After the purchase, the item quantity is reduced, and tokens are burned.
7. **Get Player Inventory**
  - Players can check their inventory to see how many items they currently own.
8. **Get Token Balance**
  - Used to check how many FPSGameTokens a player has.

## Authors

Shiella Marie P. Umali
202010956@fit.edu.ph


## License

This project is licensed under the MIT License License - see the LICENSE.md file for details
