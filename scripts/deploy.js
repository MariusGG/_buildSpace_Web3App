
async function main() {
    const [deployer] = await hre.ethers.getSigners();

    console.log("Deploying contract with the account: ", deployer.address);
    console.log("Account balance: ", (await deployer.getBalance()).toString());

    const Token = await hre.ethers.getContractFactory("kantoPokePortal");
    const token = await Token.deploy();

    console.log("kantoPokePortal address: ", token.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1); 
    })