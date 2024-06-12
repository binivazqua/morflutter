import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedPage extends StatefulWidget {
  const LoggedPage({super.key});

  @override
  State<LoggedPage> createState() => _LoggedPageState();
}

class _LoggedPageState extends State<LoggedPage> {
  // our user is:
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('signed in as ${user?.email}'),
            MaterialButton(
                color: Colors.purple,
                child: Text('Sign Out'),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                })
          ],
        ),
      ),
    );
  }
}
