
pragma solidity ^0..0;

import "./picasso.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// Have the PicassoCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract PicassoCoinCrowdsale is Crowdsale, MintedCrowdsale
 { // UPDATE THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor(uint rate, address payable wallet, PicassoCoin token) Crowdsale( rate, wallet, token) public {
        // constructor can stay empty
    }
}


contract picassoCoinCrowdsaleDeployer {
    // Create an `address public` variable called `Picasso_token_address`.
    address public kasei_token_address;

    // Create an `address public` variable called `Picasso_crowdsale_address`.
    address public Picasso_crowdsale_address;


    // Add the constructor.
    constructor(string memory name, string memory symbol, address payable wallet)

       
     public {
        // Create a new instance of the picassoCoin contract.
        PicassoCoin token=new PicassoCoin(name, symbol, 0);
        
        // Assign the token contract’s address to the `picasso_token_address` variable.
        Pasei_token_address = address(token);


        // Create a new instance of the `PicassoCoinCrowdsale` contract
        PicassoCoinCrowdsale crowd = new PicassoCoinCrowdsale(1, wallet, token);

            
        // Aassign the `PicassoCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        Picasso_crowdsale_address = address(crowd);


        // Set the `PicassoCoinCrowdsale` contract as a minter
        token.addMinter(crowd);

        
        // Have the `PicassoCoinCrowdsaleDeployer` renounce its minter role.
        token.renounceMinter();
