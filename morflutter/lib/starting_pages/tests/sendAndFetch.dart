import 'package:flutter/material.dart';
import 'package:morflutter/starting_pages/tests/readExamples.dart';
import 'package:morflutter/starting_pages/tests/writeExamples.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text('Press to test your Database'),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReadExamples()));
                },
                child: Text('Read Data')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WriteExamples()));
                },
                child: Text('Add Data')),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WriteExamples()));
              },
              color: Colors.purple[100],
              child: Text('Write data'),
            )
          ]),
        ),
      ),
    );
  }
}
