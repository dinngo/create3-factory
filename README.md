# CREATE3 Factory

Factory contract for easily deploying contracts to the same address on multiple chains, using CREATE3.

## Why?

Deploying a contract to multiple chains with the same address is annoying. One usually would create a new Ethereum account, seed it with enough tokens to pay for gas on every chain, and then deploy the contract naively. This relies on the fact that the new account's nonce is synced on all the chains, therefore resulting in the same contract address.
However, deployment is often a complex process that involves several transactions (e.g. for initialization), which means it's easy for nonces to fall out of sync and make it forever impossible to deploy the contract at the desired address.

One could use a `CREATE2` factory that deterministically deploys contracts to an address that's unrelated to the deployer's nonce, but the address is still related to the hash of the contract's creation code. This means if you wanted to use different constructor parameters on different chains, the deployed contracts will have different addresses.

A `CREATE3` factory offers the best solution: the address of the deployed contract is determined by only the salt. This makes it far easier to deploy contracts to multiple chains at the same addresses.

## Deployments

`CREATE3Factory` has been deployed to `0x9fBB3DF7C40Da2e5A0dE984fFE2CCB7C47cd0ABf` on the following networks:

- Ethereum Mainnet
- Ethereum Goerli Testnet
- Arbitrum Mainnet
- Avalanche C-Chain Mainnet
- Fantom Opera Mainnet
- Optimism Mainnet
- Polygon Mainnet
- Gnosis Chain Mainnet

## Ownable deployment

The modified `CREATE3Factory` which is ownable for testing has been deployed to `0x2a36f87b2ec3de23617907461aa3da0cc4bc3f1f` by the above `CREATE3Factory` (`0x9fBB...0ABf`) with the account `0xa3C1C91403F0026b9dd086882aDbC8Cdbc3b3cfB` and the salt `create3.factory` (`0x637265617465332e666163746f72790000000000000000000000000000000000`) on the following networks:

- Ethereum Mainnet
- Arbitrum Mainnet
- Optimism Mainnet
- Polygon Mainnet

## Usage

Call `CREATE3Factory::deploy()` to deploy a contract and `CREATE3Factory::getDeployed()` to predict the deployment address, it's as simple as it gets.

A few notes:

- The deployed contract should be aware that `msg.sender` in the constructor will be the temporary proxy contract used by `CREATE3` rather than the deployer, so common patterns like `Ownable` should be modified to accomodate for this.

## Installation

To install with [Foundry](https://github.com/foundry-rs/foundry):

```
forge install dinngo/create3-factory
```

## Local development

This project uses [Foundry](https://github.com/foundry-rs/foundry) as the development framework.

### Dependencies

```bash
forge install
```

### Compilation

```bash
forge build
```

### Deployment

Make sure that the network is defined in foundry.toml, then run:

```bash
./deploy/deploy.sh [network]
```
