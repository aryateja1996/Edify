import 'package:edify/Theme.dart';
import 'package:edify/pages/signup.dart';
// ignore: unused_import
import 'package:edify/services/export.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final _codeController = TextEditingController();
  String emailId;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[700],
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 48, horizontal: 36),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black45, blurRadius: 5.0)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan[700]),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          "Don't have an account?  ",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        TextButton(
                          child: Text(
                            "Register now",
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => SignUp())),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Input(
                      hint: 'Email',
                      changedCallback: (String input) {
                        emailId = input;
                      },
                    ),
                    SizedBox(height: 20),
                    Input(
                      hint: 'Password',
                      dontShow: true,
                      changedCallback: (String input) {
                        password = input;
                      },
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          text: 'Login',
                          callback: () {
                            login(emailId, password, context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String date() {
    DateTime date1 = DateTime.now();
    print(date1.month.toString() + date1.day.toString());

    String date = date1.month.toString() + date1.day.toString();
    return date;
  }
}
