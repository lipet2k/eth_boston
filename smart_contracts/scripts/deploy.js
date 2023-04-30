const main = async () => {
  const billingFactory = await hre.ethers.getContractFactory(
    "Billing"
  );
  const billingContract = await billingFactory.deploy();

  await billingContract.deployed();

  console.log("Billing address: ", billingContract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();
