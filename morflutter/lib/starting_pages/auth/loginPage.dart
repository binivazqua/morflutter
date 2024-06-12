import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MorfoLoginPage extends StatefulWidget {
  const MorfoLoginPage({super.key});

  @override
  State<MorfoLoginPage> createState() => MorfoLoginPageState();
}

class MorfoLoginPageState extends State<MorfoLoginPage> {
  // CREATE USER CONRTOLLERS:
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // SIGN IN METHOD:
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    print("FUNCTION DOING ITS THING...");
  }

  // CREATE A DISPOSE METHOD FOR MEMORY PURPOSES:
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.handshake_outlined,
                  size: 80,
                  color: Colors.purple[800],
                ),

                Text(
                  'MORFO',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),

                Text(
                  'Helo Again!',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),

                SizedBox(
                  height: 20,
                ),

                // USERNAME
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'email',
                            hintStyle: TextStyle(color: Colors.purple[300])),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                // PASSWORD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'password',
                            hintStyle: TextStyle(color: Colors.purple[300])),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.purple[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.purple[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                )
                // SIGN IN BUTTON

                // REGISTER BUTTON
              ],
            ),
          ),
        ));
  }
}
