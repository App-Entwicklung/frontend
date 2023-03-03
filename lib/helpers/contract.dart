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
    ethClient = Web3Client("", httpClient); //TODO! Insert url of goerli
  }

  static Future<DeployedContract> getContract() async {
    String abiFile = await rootBundle.loadString("assets/contract-ABI.json");

    String contractAdress = ""; //TODO!

    final contract = DeployedContract(
        ContractAbi.fromJson(abiFile, "Name"), //TODO! change!
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
            contract: contract, function: function, parameters: params),
        chainId: MetaMaskProvider.operatingChain);
  }

  static Credentials getPrivateEthKey() {
    // Should be exchanged by real private key input
    var rng = Random.secure();
    EthPrivateKey privateKey = EthPrivateKey.createRandom(rng);
    return EthPrivateKey.fromHex(bytesToHex(privateKey.privateKey));
  }
}
