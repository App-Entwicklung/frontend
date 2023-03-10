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
  void initState() {
    _value1 = "";
    _value2 = "";
    _value3 = "";
    _value4 = "";
    _value5 = "";
    _value6 = "";

    super.initState();
  }

  Widget nest(Widget child1, Widget child2, String text) {
    return Row(
      children: [
        Expanded(
            flex: 5,
            child:
                Padding(padding: const EdgeInsets.all(8.0), child: Text(text))),
        Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: child1,
            )),
        Expanded(
            child: Padding(padding: const EdgeInsets.all(8.0), child: child2))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Test Contract Methods")),
        body: Column(children: [
          nest(
              TextField(
                onChanged: ((value) => {
                      setState(
                        () => {_value1 = value},
                      )
                    }),
              ),
              ElevatedButton(
                onPressed: () async =>
                    {await Contract.createAccount(context, _value1)},
                child: const Text("Go"),
              ),
              "create Account"),
          nest(
              TextField(
                onChanged: ((value) => {
                      setState(
                        () => {_value2 = value},
                      )
                    }),
              ),
              ElevatedButton(
                onPressed: () async =>
                    {await Contract.sendContactRequest(context, _value2)},
                child: const Text("Go"),
              ),
              "sendContactRequest"),
          nest(
              TextField(
                onChanged: ((value) => {
                      setState(
                        () => {_value3 = value},
                      )
                    }),
              ),
              ElevatedButton(
                onPressed: () async =>
                    {await Contract.acceptContactRequest(context, _value3)},
                child: const Text("Go"),
              ),
              "acceptContactRequest"),
          nest(
              TextField(
                onChanged: ((value) => {
                      setState(
                        () => {_value4 = value},
                      )
                    }),
              ),
              ElevatedButton(
                onPressed: () async {
                  final result =
                      await Contract.getReceivedContactRequests(context);
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
                child: const Text("Go"),
              ),
              "getReceivedContactRequests"),
          nest(
              TextField(
                onChanged: ((value) => {
                      setState(
                        () => {_value5 = value},
                      )
                    }),
              ),
              ElevatedButton(
                onPressed: () async =>
                    {await Contract.sendMessage(context, _value5, "HI")},
                child: const Text("Go"),
              ),
              "sendMessage"),
          nest(
              TextField(
                onChanged: ((value) => {
                      setState(
                        () => {_value6 = value},
                      )
                    }),
              ),
              ElevatedButton(
                onPressed: () async {
                  final result = await Contract.getMessages(context, _value6);
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
                child: const Text("Go"),
              ),
              "getMessages"),
        ]));
  }
}
