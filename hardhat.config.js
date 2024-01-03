require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    goerli: {
      url: "https://empty-fragrant-diamond.ethereum-goerli.discover.quiknode.pro/5a9edaf891cf68b647a4f63d0bf90510edf6c833/",
      accounts: ["2a442a5aea064e8f9b00ae0069dd857355a9b37682d61e82151118007c3d6b66"],
    },
  },
};
