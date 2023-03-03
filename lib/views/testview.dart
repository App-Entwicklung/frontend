import 'package:flutter/material.dart';
import "../helpers/contract.dart";

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late String _value1;
  late String _value2;
  late String _value3;
  late String _value4;
  late String _value5;
  late String _value6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test contract Methods")),
      body: ListView(children: [
        Row(
          children: [
            const Text("create Account"),
            TextField(
              onChanged: ((value) => {
                    setState(
                      () => {_value1 = value},
                    )
                  }),
            ),
            ElevatedButton(
                onPressed: () async => {await Contract.createAccount(_value1)},
                child: const Text("Go"))
          ],
        ),
        Row(
          children: [
            const Text("sendContactRequest"),
            TextField(
              onChanged: ((value) => {
                    setState(
                      () => {_value2 = value},
                    )
                  }),
            ),
            ElevatedButton(
                onPressed: () async =>
                    {await Contract.sendContactRequest(_value2)},
                child: const Text("Go"))
          ],
        ),
        Row(
          children: [
            const Text("acceptContactRequest"),
            TextField(
              onChanged: ((value) => {
                    setState(
                      () => {_value3 = value},
                    )
                  }),
            ),
            ElevatedButton(
                onPressed: () async =>
                    {await Contract.acceptContactRequest(_value3)},
                child: const Text("Go"))
          ],
        ),
        Row(
          children: [
            const Text("getReceivedContactRequests"),
            TextField(
              onChanged: ((value) => {
                    setState(
                      () => {_value4 = value},
                    )
                  }),
            ),
            ElevatedButton(
                onPressed: () async {
                  final result = await Contract.getReceivedContactRequests();
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return Container(
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              result.toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }));
                },
                child: const Text("Go"))
          ],
        ),
        Row(
          children: [
            const Text("sendMessage"),
            TextField(
              onChanged: ((value) => {
                    setState(
                      () => {_value5 = value},
                    )
                  }),
            ),
            ElevatedButton(
                onPressed: () async =>
                    {await Contract.sendMessage(_value5, "HI")},
                child: const Text("Go"))
          ],
        ),
        Row(
          children: [
            const Text("getMessages"),
            TextField(
              onChanged: ((value) => {
                    setState(
                      () => {_value6 = value},
                    )
                  }),
            ),
            ElevatedButton(
                onPressed: () async {
                  final result = await Contract.getMessages(_value6);
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return Container(
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              result.toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }));
                },
                child: const Text("Go"))
          ],
        ),
      ]),
    );
  }
}
