<script>
  import { onMount } from 'svelte';
  import contract from './Contract.js';

  let contractValue = null;
  let userAddress = null;
  let newUsername = ''; // Die Variable, die den Wert des Texteingabefelds speichert

	async function connectWallet() {
		if (window.ethereum) {
			// ethereum is an object injected by the wallet. Let's check if is available
			const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' }); // use the request method to get the accounts, aka logging in to Metamask
			if (accounts.length > 0) {
				// it returns an array of accounts, it should have at least 1 element
				userAddress = accounts[0]; // update the state
			} else {
				alert('No ethereum accounts found');
			}
		} else {
			alert('No ethereum Wallet found');
		}
	}


  async function getName() {
    contractValue = await contract.methods.getName().call({
		from: userAddress,
	});
  console.log(contractValue)
  }

  onMount(async () => {
    await getName();
  });


  
	async function setName() {
		await contract.methods.setName(newUsername).send({
		from: userAddress
	});
  }

  onMount(async () => {
    await setName();
  });


  function handleSubmitNewUsername() {
    console.log(newUsername); // Gibt den Wert der Variable `name` in der Konsole aus

  }



</script>

<main>

<h1>Account Adress: {userAddress}</h1>
<button on:click={connectWallet}>Connect</button>

<h1>Your Username is: {contractValue}</h1>
<button on:click={getName}>Read Name</button>


<form on:submit|preventDefault={handleSubmitNewUsername}>
	<label for="name">Name:</label>
	<input type="text" id="name" bind:value={newUsername}>
	<button on:click={setName}>Send Something (Change Name)</button>
  </form>

</main>
