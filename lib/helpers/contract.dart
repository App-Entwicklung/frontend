import 'dart:math';

import 'package:flutter/services.dart';
import 'package:frontend/classes/meta_mask_provider.dart';
import 'package:http/http.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

class Contract {
  static late Web3Client ethClient;
  static late Client httpClient;

  static void initEthClient() {
    httpClient = Client();
    ethClient =
        Web3Client("https://goerli.blockpi.network/v1/rpc/public", httpClient);
  }

  static Future<DeployedContract> getContract() async {
    String abiFile = await rootBundle.loadString("assets/contract-ABI.json");

    String contractAdress = "0x86bb1F3B75b013a1Bdd31EFb20de79E20b137036";

    final contract = DeployedContract(ContractAbi.fromJson(abiFile, "ChatApp"),
        EthereumAddress.fromHex(contractAdress));

    return contract;
  }

  static Future<List<dynamic>> readFromBlockchain(String functionName,
      [List<dynamic> params = const []]) async {
    final contract = await getContract();
    final function = contract.function(functionName);

    final result = await ethClient.call(
        contract: contract,
        function: function,
        params: params.isEmpty ? [] : params);

    return result;
  }

  static Future<void> writeToBlockchain(String functionName,
      [List<dynamic> params = const []]) async {
    final contract = await getContract();
    final function = contract.function(functionName);

    await ethClient.sendTransaction(
        getPrivateEthKey(),
        Transaction.callContract(
            maxGas: ((await ethClient.estimateGas()).toInt() + 1) * 2,
            contract: contract,
            function: function,
            parameters: params),
        chainId: MetaMaskProvider.operatingChain);
  }

  static Future<void> createAccount(String accountName) async {
    await writeToBlockchain("createAccount", [accountName]);
  }

  static Future<void> sendContactRequest(String ethAddress) async {
    EthereumAddress address = EthereumAddress.fromHex(ethAddress);
    await writeToBlockchain("sendContactRequest", [address]);
  }

  static Future<void> acceptContactRequest(String ethAdress) async {
    EthereumAddress address = EthereumAddress.fromHex(ethAdress);
    await writeToBlockchain("acceptContactRequest", [address]);
  }

  static Future<List<dynamic>> getReceivedContactRequests() async {
    final result = await readFromBlockchain("getReceivedContactRequests");
    return result;
  }

  static Future<void> sendMessage(String ethAddress, String message) async {
    EthereumAddress address = EthereumAddress.fromHex(ethAddress);
    await writeToBlockchain("sendMessage", [address, message]);
  }

  static Future<List<dynamic>> getMessages(String ethAddress) async {
    EthereumAddress address = EthereumAddress.fromHex(ethAddress);
    final result = await readFromBlockchain("getMessages", [address]);
    return result;
  }

  static Credentials getPrivateEthKey() {
    // Should be exchanged by real private key input
    var rng = Random.secure();
    EthPrivateKey privateKey = EthPrivateKey.createRandom(rng);
    return EthPrivateKey.fromHex(bytesToHex(privateKey.privateKey));
  }
}
