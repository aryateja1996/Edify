import 'package:edify/Theme.dart';

import 'package:edify/services/FirebaseServices.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String emailId;
  String phone;
  String name;
  String password;
  int sem;
  String cat;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    if (!isChecked) {
      cat = 'Lecture';
    } else {
      cat = 'Student';
    }
    return Scaffold(
      //backgroundColor: Colors.amberAccent,
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        width: double.infinity,
        height: double.infinity,
        //color: Colors.amberAccent,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SignUp Form',
              style: TextStyle(color: Colors.blueAccent, fontSize: 20),
            ),
            SizedBox(
              height: 65,
            ),
            Input(
              hint: 'Name',
              changedCallback: (String input) {
                name = input;
              },
            ),
            SizedBox(
              height: 15,
            ),
            Input(
              hint: 'Email',
              changedCallback: (String input) {
                emailId = input;
              },
            ),
            SizedBox(
              height: 15,
            ),
            Input(
              hint: 'Phone',
              changedCallback: (String input) {
                phone = input;
              },
            ),
            SizedBox(
              height: 15,
            ),
            Input(
              hint: 'Password',
              changedCallback: (String input) {
                password = input;
              },
            ),
            SizedBox(
              height: 15,
            ),
            Input(
              hint: 'Confirm Password',
              changedCallback: (String input) {
                if (password == input) {
                  password = input;
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text('Semester:  '),
                TextButton(
                    onPressed: () {
                      setState(() {
                        sem = 1;
                      });
                    },
                    child: Text('1')),
                TextButton(
                    onPressed: () {
                      setState(() {
                        sem = 2;
                      });
                    },
                    child: Text('2')),
                TextButton(
                    onPressed: () {
                      setState(() {
                        sem = 3;
                      });
                    },
                    child: Text('3')),
                TextButton(
                    onPressed: () {
                      setState(() {
                        sem = 4;
                      });
                    },
                    child: Text('4')),
                TextButton(
                    onPressed: () {
                      setState(() {
                        sem = 5;
                      });
                    },
                    child: Text('5')),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                        print(cat);
                      });
                    }),
                Text('Check if You are a Lecture'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Button(
              text: 'Sign Up',
              callback: () {
                //print(emailId);
                signup(name, phone, emailId, password, sem, cat, context);

                //date();
              },
            ),
          ],
        ),
      ),
    );
  }
}
