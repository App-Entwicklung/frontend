import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/meta_mask_provider.dart';
import '../helpers/chains.dart';
import '../main.dart';

class Web3Home extends StatelessWidget {
  const Web3Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Connect Metamask",
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: ChangeNotifierProvider(
            create: (context) => MetaMaskProvider()..start(),
            builder: (context, child) {
              return Center(
                child: Consumer<MetaMaskProvider>(
                  builder: (context, provider, child) {
                    late String message;
                    bool connected = false;
                    if (provider.isConnected && provider.isInOperatingChain) {
                      message =
                          'Connected ${context.read<MetaMaskProvider>().currentAddress}';
                      connected = true;
                    } else if (provider.isConnected &&
                        !provider.isInOperatingChain) {
                      message =
                          'Wrong chain. Please connect to ${MetaMaskProvider.operatingChain}';
                    } else if (provider.isEnabled) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MaterialButton(
                            onPressed: () =>
                                context.read<MetaMaskProvider>().connect(),
                            color: Colors.white,
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Please connect to ${Chains.getChain(MetaMaskProvider.operatingChain)}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Image.network(
                                      'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
                                      width: 250,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      message = 'Please use a Web3 supported browser.';
                    }

                    //Page Content starts here
                    return connected
                        ? const MyApp()
                        : Text(
                            message,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.red),
                          );
                  },
                ),
              );
            }),
      ),
    );
  }
}
