const main = async () => {
  const nftContractFactory = await ethers.deployContract("MyEpicNFT");
  const nftContract = await nftContractFactory.waitForDeployment();
  console.log("Contract deployed to:", await nftContract.getAddress());

   // Call the function.
   let txn = await nftContract.makeAnEpicNFT()
   // Wait for it to be mined.
   await txn.wait()
 
   // Mint another NFT for fun.
   txn = await nftContract.makeAnEpicNFT()
   // Wait for it to be mined.
   await txn.wait()
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();