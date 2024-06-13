import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:morflutter/components/texFil.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  // FIREBASE REAL TIME DATABASE USER INFORMATION:
  final _MorfoDatabase = FirebaseDatabase.instance.ref('users');

  // CREATE USER CONRTOLLERS:
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();

  // CREATE A DISPOSE METHOD FOR MEMORY PURPOSES:
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // SEND USER DATA FUNCTION:
  void sendUserData() {
    /*_MorfoDatabase.child('user #')
        .set({
          'user name': _nameController.text.trim(),
          'user_lastname': _lastnameController.text.trim(),
          'user_email': _emailController.text.trim(),
          'user_password': _passwordController.text.trim(),
          'user_id': 'none',
        })
        .then((_) => print('Data values have been sent!'))
        .catchError((error) => print('Something didnt work! Error: $error'), );
    ;*/

    try {
      _MorfoDatabase.child('user #').set({
        'user name': _nameController.text.trim(),
        'user_lastname': _lastnameController.text.trim(),
        'user_email': _emailController.text.trim(),
        'user_password': _passwordController.text.trim(),
        'user_id': 'none',
      });
      print('Data values have been sent!');

      ;
    } catch (error) {
      ('Something didnt work! Error: $error');
    }
  }

  // SIGN UP METHOD
  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hi there!',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),

                  Text(
                    'New here? Fill in some info!',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // USERNAME
                  niceTextField(
                      dataRequired: 'first name',
                      textController: _nameController),

                  SizedBox(
                    height: 20,
                  ),

                  // LASTNAME
                  niceTextField(
                      dataRequired: 'last name',
                      textController: _lastnameController),

                  SizedBox(
                    height: 20,
                  ),
                  // EMAIL
                  niceTextField(
                      dataRequired: 'email', textController: _emailController),

                  SizedBox(
                    height: 20,
                  ),
                  // PASSWORD
                  niceTextField(
                      dataRequired: 'password',
                      textController: _passwordController),

                  SizedBox(height: 20),

                  ElevatedButton(
                      onPressed: sendUserData, child: Text('Verify my data')),

                  SizedBox(height: 20),

                  GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.purple[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.purple[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Log in!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                  // SIGN IN BUTTON

                  // REGISTER BUTTON
                ],
              ),
            ),
          ),
        ));
  }
}
