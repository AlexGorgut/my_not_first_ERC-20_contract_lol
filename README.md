## Foundry


Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage
# OurToken
`OurToken` is a standard ERC20 token implemented in Solidity. The contract is built on top of the OpenZeppelin's ERC20 contract, which provides basic functionalities like transferring tokens, approving allowances, checking balances, and total supply.

## Contract Details
### Constructor
The constructor function takes an initial supply of tokens as argument that will be minted to the message sender's account.

``` solidity
constructor(uint256 initialSupply) ERC20("OurToken", "OT") {
  _mint(msg.sender, initialSupply);
}
```
### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
