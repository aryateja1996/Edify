//import 'package:edify/pages/exports.dart';
import 'package:edify/pages/exports.dart';
import 'package:edify/services/export.dart';
import 'package:flutter/material.dart';

//typedef InputChangedCallback = void Function(String text);

class Input extends StatelessWidget {
  final String hint;
  final bool dontShow;
  final TextInputType keytype;
  //final InputChangedCallback changedCallback;
  final Function changedCallback;
  Input({this.hint, this.changedCallback, this.dontShow, this.keytype});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keytype,
      decoration: InputDecoration(
        hoverColor: Colors.cyan[700],
        focusColor: Colors.cyan[700],
        labelText: hint,
        labelStyle: TextStyle(color: Colors.black38, fontSize: 13),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyan[700],
            width: 2,
          ),
        ),
      ),
      obscureText: dontShow == null ? false : dontShow,
      onChanged: this.changedCallback,
    );
  }
}

class Button extends StatefulWidget {
  final String text;
  final Function callback;
  Button({this.text, this.callback});
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: TextButton(
        onPressed: widget.callback,
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }
}

class Burger extends StatefulWidget {
  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  String date() {
    DateTime date1 = DateTime.now();
    print(date1.month.toString() + date1.day.toString());

    String date = date1.month.toString() + date1.day.toString();
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: 30.0, left: 10.0, right: 10.0, bottom: 10.0),
                color: Colors.amber,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        //color: Colors.black,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            userModel.name[0],
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name : ${userModel.name}'),
                          Text('Email : ${userModel.email}'),
                          Text('Phone : ${userModel.phone}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  String todayDate = date();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_view_day),
                title: Text('Time Table'),
                onTap: () {
                  String todayDate = date();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimeTable(date: todayDate)));
                },
              ),
              ListTile(
                leading: Icon(Icons.podcasts),
                title: Text('Posts'),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => Post())),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Cultural'),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => Cultural())),
              ),
              ListTile(
                leading: Icon(Icons.dangerous_outlined),
                title: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
Future<void> _showMyDialogError(String text, BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(text),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showMyDialog(String e, BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: Center(
              child: Text(e),
            ),
          ));
    },
  );
}

String date() {
  DateTime date1 = DateTime.now();
  print(date1.month.toString() + date1.day.toString());

  String date = date1.month.toString() + date1.day.toString();
  return date;
}
