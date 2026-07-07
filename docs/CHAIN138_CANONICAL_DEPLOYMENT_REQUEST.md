# Chain 138 Canonical CREATE3Factory Deployment Request

DeFi Oracle Meta Mainnet (Chain ID `138`) is ready for the canonical Protocolink `CREATE3Factory` deployment path, but the canonical address requires a nonce-0 deployment from Dinngo's production deployer.

## Required canonical deployment

- Chain: DeFi Oracle Meta Mainnet
- Chain ID: `138`
- RPC: `https://rpc.d-bis.org`
- Canonical deployer: `0xC3f1bD7ffbD55751Cd80920BEdf8A794c5a83c3f`
- Required deployer nonce: `0`
- Expected `CREATE3Factory`: `0xFa3e9a110E6975ec868E9ed72ac6034eE4255B64`
- Explorer: `https://blockscout.defi-oracle.io/address/0xFa3e9a110E6975ec868E9ed72ac6034eE4255B64`

The canonical deployer has been prefunded on Chain 138:

- Prefund transaction: `0x9a88f7faf0ba0861c608962ea6bd2cfb861093e0ee82c20e50d911f818e25c92`
- Amount: `0.01 ETH`
- Current canonical deployer nonce after prefund: `0`

## Request

Please broadcast the standard production deployment transaction from `0xC3f1bD7ffbD55751Cd80920BEdf8A794c5a83c3f` at nonce `0`, or provide a signed raw transaction that Chain 138 operators can broadcast.

After deployment, verify:

```console
cast codesize 0xFa3e9a110E6975ec868E9ed72ac6034eE4255B64 --rpc-url https://rpc.d-bis.org
```

Protocolink's canonical Router deployment can proceed once this address has bytecode.

## Non-canonical fallback

For integration testing only, Chain 138 also has a non-canonical fallback deployment:

- Fallback `CREATE3Factory`: `0x486B2E145F486eFA0190a60259B5BB464BD6b22b`
- Fallback Router: `0xE7f51632381d0791eC5c05F5585e7b1bFf1de5F5`

This fallback should not replace the canonical cross-chain deployment path.
