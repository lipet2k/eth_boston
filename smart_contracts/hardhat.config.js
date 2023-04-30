
require ("dotenv").config();
require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: {
    version: "0.8.0",
    settings: {
      optimizer: {
        runs: 200,
        enabled: true,
      },
    },
  },
  networks: {
    sepolia: {
      url: process.env.API_URL,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};