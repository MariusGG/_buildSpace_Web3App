const main = async () => {
    const kantoPokeContractFactory = await hre.ethers.getContractFactory('KantoPokePortal');
    const kantoPokeContract = await kantoPokeContractFactory.deploy();
    await kantoPokeContract.deployed();
    console.log('Contract address:', kantoPokeContract.address);
  
  
    /**
     * Let's send a few votes!
     */
    let voteTxn = await kantoPokeContract.voteBulbasaur();
    await voteTxn.wait(); // Wait for the transaction to be mined
  
    let voteTxn2 = await kantoPokeContract.voteCharmander();
    await voteTxn2.wait(); 

    const [_, randoPerson] = await ethers.getSigners();
    voteTxn = await kantoPokeContract.connect(randoPerson).voteBulbasaur();
    await voteTxn.wait(); // Wait for the transaction to be mined
  

    let allVotes = await kantoPokeContract.getAllVotes();
    console.log(allVotes, 'allVotes');

    let totalBulbasaurVotes = await kantoPokeContract.getTotalBulbasaurVotes();
    console.log(totalBulbasaurVotes.toNumber(), "BulbasaurVotes");

    let totalCharmanderVotes = await kantoPokeContract.getTotalCharmanderVotes();
    console.log(totalCharmanderVotes.toNumber(), "CharmanderVotes");

    let totalSquirtleVotes = await kantoPokeContract.getTotalSquirtleVotes();
    console.log(totalSquirtleVotes.toNumber(), "SquirtleVotes");
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