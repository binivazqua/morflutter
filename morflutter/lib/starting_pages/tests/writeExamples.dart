import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
/* FIREBASE REQUIRED IMPORTS */
import 'package:firebase_core/firebase_core.dart';
import 'package:morflutter/starting_pages/tests/sendAndFetch.dart';

class WriteExamples extends StatefulWidget {
  const WriteExamples({super.key});

  @override
  State<WriteExamples> createState() => _WriteExamplesState();
}

class _WriteExamplesState extends State<WriteExamples> {
  /* HOW TO SEND DATA TO REAL TIME DATABASE:

      1. Create an ainstance of our database.
        // a path to our real time database, wich when initialized,
        points to the top of our tree.
      2. Create a child to my reference inside my builder, wich will 
      refer (xd?) to my branches.
      3. Write data using <set> method.
        // This should be done in a JSON format, as follows:
        {
          'key': 'data',
          'key1': 'data1',
          'key3': 'data3',
        }
      

  */

  // STEP 1:
  final database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    // STEP #2:
    final testWrite =
        database.child('testWrite/'); // MAKE SURE U HAVE '/' in there!

    return Scaffold(
      appBar: AppBar(
        title: Text('Write Examples'),
        backgroundColor: Colors.purple[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // PROPER SYNTAXIS TO WRITE DATA IN A JSON FORMAT.
                    testWrite
                        .set({
                          'child1': 'value1',
                          'child2': 'value2',
                          'child3': 'value3',
                        })
                        .then((_) => print('Data values have been sent!'))
                        .catchError((error) =>
                            print('Something didnt work! Error: $error'));
                  },
                  child: Text('Press to send')),
              ElevatedButton(
                  onPressed: () {
                    // PROPER SYNTAXIS TO CHANGE DATA.
                    testWrite
                        .child('/child1/')
                        .set('another value')
                        .then((_) => print('Data values have been CHANGED!'))
                        .catchError((error) =>
                            print('Something didnt work! Error: $error'));
                    ;
                  },
                  child: Text('Press to change')),
              ElevatedButton(
                  onPressed: () {
                    // PROPER SYNTAXIS TO CHANGE/REPLACE DATA.
                    testWrite
                        .update({
                          'child2':
                              'value now equals = ${Random().nextInt(100)}'
                        })
                        .then((_) => print('Data values have been UPDATED!'))
                        .catchError((error) =>
                            print('Something didnt work! Error: $error'));
                    ;
                  },
                  child: Text('Press to update')),
            ],
          ),
        ),
      ),
    );
  }
}
