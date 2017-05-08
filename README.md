## Requirements

* OSX or Linux 

* Python 3.5+ (Preferably from Homebrew if OSX)

* solc

## Fund collection and token issuance process walkthrough

### Contracts

Storj tokens are based on Zeppelin `StandardToken` ERC-20 contract. This contract has been further mixed in to include [burn](https://github.com/Storj/storj-contracts/blob/master/contracts/BurnableToken.sol) and [upgradeable](https://github.com/Storj/storj-contracts/blob/master/contracts/UpgradeableToken.sol) traits.

OpenZeppelin is pinned down to commit ffce7e3b08afad8d08a5fdbfbbca098f4d6cdf4e and `solc` is pinned down to version 0.4.8.

### Issuance

500,000,000 tokens will be created on Storj Ethereum smaster wallet. This is the total supply of current Counterparty tokens.

These tokens are then allocated (using `approve`) for 
 
* CounterParty -> Storj conversion server (based on the current Storj circulation)

* Token sale (at the end of the sale)
 
* Storj the company (held back in the master wallet)

### End of token sale

Token distribution is exported as CSV and tokens allocated to their corresponding ETH addresses through an issuance script. Token sale accepts USD, BTC and ETH. Pricing and currency conversion mechanism for tokens can be decided later.

Storj will retain % tokens for the company and these are moved to a time locked vault (TODO, contract here).

Storj will burn % of their tokens.

Early investors may have their tokens also moved in time locked vaults.

[Issuer contract and script is used to distribute token](https://github.com/Storj/storj-contracts/blob/master/contracts/Issuer.sol) to retail token sale contributors.

### Conversion

Tokens are directly distributed from `approve` pool given to the conversion server.

* Counterparty user gives their Ethereum address

* Server gives a Counterparty burn address where old tokens can be sent
 
* When burn addresss is credited the conversion server does `transferFrom` and credits the given Ethereum address with the same amount of tokens

## Installation

### solc

[Install solc 0.4.8](http://solidity.readthedocs.io/en/develop/installing-solidity.html#binary-packages). This exact version is required. Read full paragraph how to install it on OSX.

### Repo

Clone the repository and initialize submodules:

    git clone --recursive git@github.com:Storj/storj-contracts.git

### Populus

First install Python 3.5+:

    brew install python3

Then in the repo folder we install Python dependencies in `venv`:

    cd storj-contracts
    python3.5 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    
Then test solc:

    solc --version
    
    solc, the solidity compiler commandline interface
    Version: 0.4.8+commit.60cc1668.Darwin.appleclang
    
Then test populus:
                                         
    populus          
    
    Usage: populus [OPTIONS] COMMAND [ARGS]...
    ...
                                                
## Compiling contracts
                   
Compile:                   
                             
    populus compile                                
                              
Output will be in `build` folder.                                       
                                        
## Running tests

Tests are written using `py.test` in tests folder.

To run tests activate the virtual environment and then run:

    py.test
    
    


                                                                           
