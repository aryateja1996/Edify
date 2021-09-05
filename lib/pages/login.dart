import 'package:edify/Theme.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        Text(
                          "Register now",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Input(hint: 'Email'),
                    SizedBox(height: 20),
                    Input(
                      hint: 'Password',
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(text: 'Login'),
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
}
