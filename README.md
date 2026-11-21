# Sample Hardhat Project: DeFi Apps

Prior to running the code in the project, please make sure [node.js](https://nodejs.org/) is installed.

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
