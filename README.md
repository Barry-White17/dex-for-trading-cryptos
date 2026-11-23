# Sample Hardhat Project: Dex for Trading Cryptos

# Link to vercel deployed frontend
https://dex-for-trading-cryptos.vercel.app

# Link to github repo
https://github.com/Barry-White17/dex-for-trading-cryptos

### Info

* Note should be taken;
-  That the project's UI is just wireframe now, to showcase a working architecture.
- That the project is self-initiated to showcase competence
- 
- A production build for ui is to be made with ShadcnUI and TailwindCss

## How to use the project

## Useful Commands

The following commands are helpful for your to go through the examples in the book (Note, you should run these commands in current directory):

Install all dependencies for the project:

```shell
npm install
```

Compile smart contracts in this project (it is helpful to verify if there are syntax error or missing dependencies):

```shell
npx hardhat compile
```

Start local EVM:

```shell
npx hardhat node
```

Deploying Smart Contracts of the project:

```shell
npx hardhat run scripts/deploy.js --network localhost # Deploy on local EVM
npx hardhat run scripts/deploy.js --network sepolia    # Deploy on Sepolia Network (TestNet)

# OR

npm run deploy localhost # Deploy on local EVM
npm run deploy sepolia    # Deploy on Sepolia Network (TestNet)
```

Start Hardhat console with local EVM:

```shell
npx hardhat console --network localhost
```

Run test cases with Hardhat:

```shell
npx hardhat test
```

Start React Web UI:

```shell
npm start
```

**Enjoy the exploration!**

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

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
