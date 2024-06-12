import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:morflutter/starting_pages/auth/loginPage.dart';
import 'package:morflutter/starting_pages/tests/sendAndFetch.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SendAndfetch();
              } else {
                return MorfoLoginPage();
              }
            }));
  }
}
