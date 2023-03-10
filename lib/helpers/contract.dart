import 'dart:math';

import 'package:flutter/services.dart';
import 'package:frontend/classes/meta_mask_provider.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
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

  static Future<List<dynamic>> readFromBlockchain(context,String functionName,
      [List<dynamic> params = const []]) async {
    final contract = await getContract();
    final function = contract.function(functionName);

    final result = await ethClient.call(
      sender: EthereumAddress.fromHex(
        Provider.of<MetaMaskProvider>(context, listen: false).currentAddress),
        contract: contract,
        function: function,
        params: params.isEmpty ? [] : params);

    return result;
  }

  static Future<void> writeToBlockchain(context, String functionName,
      [List<dynamic> params = const []]) async {
    final contract = await getContract();
    final function = contract.function(functionName);

    final myAddress = EthereumAddress.fromHex(
        Provider.of<MetaMaskProvider>(context, listen: false).currentAddress);

    final price = await ethClient.estimateGas(
        sender: myAddress,
        to: contract.address,
        data: function.encodeCall(params));
    print(await ethClient.getBalance(EthereumAddress.fromHex(
        Provider.of<MetaMaskProvider>(context, listen: false).currentAddress)));

    print("MaxGas plain: $price");
    print("MaxGas String: ${price.toString()}");

    final transaction = Transaction.callContract(
        from: myAddress,
        maxGas: price.toInt(),
        gasPrice: EtherAmount.fromUnitAndValue(EtherUnit.gwei, 50),
        value: EtherAmount.zero(),
        contract: contract,
        function: function,
        parameters: params);

    await ethClient.sendTransaction(getPrivateEthKey(), transaction,
        chainId: MetaMaskProvider.operatingChain);
  }

  static Future<void> createAccount(context, String accountName) async {
    await writeToBlockchain(context, "createAccount", [accountName]);
  }

  static Future<void> sendContactRequest(context, String ethAddress) async {
    EthereumAddress address = EthereumAddress.fromHex(ethAddress);
    await writeToBlockchain(context, "sendContactRequest", [address]);
  }

  static Future<void> acceptContactRequest(context, String ethAdress) async {
    EthereumAddress address = EthereumAddress.fromHex(ethAdress);
    await writeToBlockchain(context, "acceptContactRequest", [address]);
  }

  static Future<List<dynamic>> getReceivedContactRequests(context) async {
    final result = await readFromBlockchain(context,"getReceivedContactRequests");
    return result;
  }

  static Future<void> sendMessage(
      context, String ethAddress, String message) async {
    EthereumAddress address = EthereumAddress.fromHex(ethAddress);
    await writeToBlockchain(context, "sendMessage", [address, message]);
  }

  static Future<List<dynamic>> getMessages(context,String ethAddress) async {
    EthereumAddress address = EthereumAddress.fromHex(ethAddress);
    final result = await readFromBlockchain(context,"getMessages", [address]);
    return result;
  }

  static Credentials getPrivateEthKey() {
    // Should be exchanged by real private key input
    var rng = Random.secure();
    EthPrivateKey privateKey = EthPrivateKey.createRandom(rng);
    return EthPrivateKey.fromHex(bytesToHex(privateKey.privateKey));
  }
}
