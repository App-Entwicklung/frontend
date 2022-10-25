import 'package:flutter/material.dart';

class DevView extends StatefulWidget {
  const DevView({Key? key}) : super(key: key);

  @override
  State<DevView> createState() => _DevViewState();
}

class _DevViewState extends State<DevView> {
  final views = ['/', '/chat', '/chatsOverview'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('An welcher view hast du entwickelt?')),
      body: ListView.builder(
        shrinkWrap: false,
        itemCount: views.length,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
              onPressed: () => {Navigator.of(context).pushNamed(views[index])},
              child: Text(views[index].substring(1, views[index].length)));
        },
      ),
    );
  }
}
