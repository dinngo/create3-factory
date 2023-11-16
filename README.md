# CREATE3 Factory

Factory contract for easily deploying contracts to the same address on multiple chains, using CREATE3.

## Why?

Deploying a contract to multiple chains with the same address is annoying. One usually would create a new Ethereum account, seed it with enough tokens to pay for gas on every chain, and then deploy the contract naively. This relies on the fact that the new account's nonce is synced on all the chains, therefore resulting in the same contract address.
However, deployment is often a complex process that involves several transactions (e.g. for initialization), which means it's easy for nonces to fall out of sync and make it forever impossible to deploy the contract at the desired address.

One could use a `CREATE2` factory that deterministically deploys contracts to an address that's unrelated to the deployer's nonce, but the address is still related to the hash of the contract's creation code. This means if you wanted to use different constructor parameters on different chains, the deployed contracts will have different addresses.

A `CREATE3` factory offers the best solution: the address of the deployed contract is determined by only the salt. This makes it far easier to deploy contracts to multiple chains at the same addresses.

## Deployments

Production `CREATE3Factory` has been deployed to `0xFa3e9a110E6975ec868E9ed72ac6034eE4255B64` by nonce 0 of `0xC3f1bD7ffbD55751Cd80920BEdf8A794c5a83c3f`

Testing `CREATE3Factory` has been deployed to `0xB9504E656866cCB985Aa3f1Af7b8B886f8485Df6` by nonce 0 of `0xDdbe07CB6D77e81802C55bB381546c0DA51163dd`

## Usage

Call `CREATE3Factory::deploy()` to deploy a contract and `CREATE3Factory::getDeployed()` to predict the deployment address, it's as simple as it gets.

A few notes:

- The deployed contract should be aware that `msg.sender` in the constructor will be the temporary proxy contract used by `CREATE3` rather than the deployer, so common patterns like `Ownable` should be modified to accommodate for this.

### Deployment

Make sure that the network is defined in foundry.toml, then run:

```bash
forge script script/Deploy.s.sol -f <NETWORK> -vvvv --json --broadcast --verify --legacy --with-gas-price <GAS-IN-WEI>
```
