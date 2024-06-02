import 'package:flutter/material.dart';

class SendAndfetch extends StatefulWidget {
  const SendAndfetch({
    super.key,
  });

  @override
  State<SendAndfetch> createState() => _SendAndfetchState();
}

class _SendAndfetchState extends State<SendAndfetch> {
  int _counter = 0;
  final String title = "My Real Time Database App";

  // FIREBASE PURPOSE ONLY:
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ElevatedButton(onPressed: () {}, child: Text('Read Data')),
          ElevatedButton(onPressed: () {}, child: Text('Add Data')),
        ]),
      ),
    );
  }
}
