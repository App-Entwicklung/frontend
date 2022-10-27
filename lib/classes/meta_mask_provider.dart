import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';

class MetaMaskProvider extends ChangeNotifier {
  static const operatingChain = 5; // Goerli test network
  String currentAddress = "";
  int currentChain = -1;

  bool get isEnabled => ethereum != null;
  bool get isInOperatingChain => currentChain == operatingChain;
  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  Future<void> connect() async {
    if (isEnabled) {
      final accounts = await ethereum!.requestAccount();
      if (accounts.isNotEmpty) currentAddress = accounts.first;
      currentChain = await ethereum!.getChainId();
      notifyListeners();
    }
  }

  reset() {
    currentAddress = "";
    currentChain = -1;
    notifyListeners();
  }

  start() {
    if (isEnabled) {
      ethereum!.onAccountsChanged((accounts) => reset());
      ethereum!.onChainChanged((accounts) => reset());
    }
  }
}
