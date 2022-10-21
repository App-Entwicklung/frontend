import 'package:flutter/material.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:url_launcher/url_launcher_string.dart';

class MetamaskLogin extends StatefulWidget {
  const MetamaskLogin({Key? key}) : super(key: key);

  @override
  State<MetamaskLogin> createState() => _MetamaskLoginState();
}

class _MetamaskLoginState extends State<MetamaskLogin> {
  var connector = WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
        name: 'My App',
        description: 'An app for converting pictures to NFT',
        url: 'https://walletconnect.org',
        icons: [
          'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login via Metamask'),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/main_page_image.png',
            fit: BoxFit.fitHeight,
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Connect with Metamask'),
          )
        ],
      )),
    );
  }
}
