import 'package:flutter/material.dart';

/* FIREBASE REQUIRED IMPORTS */
import 'package:firebase_core/firebase_core.dart';
import 'package:morflutter/starting_pages/auth/loginPage.dart';
import 'package:morflutter/starting_pages/auth/mainPage.dart';
import 'package:morflutter/starting_pages/tests/sendAndFetch.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
void main() async {
  //void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}
// TO DEBUG: 

void main() {
  runApp(MainApp());
}
*/

// MORE SECURE INITIALIZATION BUILDER:
void main() async {
  //void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final Future<FirebaseApp> myApp = Firebase.initializeApp();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return SendAndfetch();
    return MaterialApp(
      home: FutureBuilder(
          future: myApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(
                  'There is a fuckin error around here: ${snapshot.error.toString()}');
              return Text('Somethin went wrong!!!');
            } else if (snapshot.hasData) {
              //return SendAndfetch();
              return MainPage();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
