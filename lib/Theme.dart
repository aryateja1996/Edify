//import 'package:edify/pages/exports.dart';
import 'package:edify/pages/exports.dart';
import 'package:flutter/material.dart';

typedef InputChangedCallback = void Function(String text);

class Input extends StatelessWidget {
  final String hint;
  final InputChangedCallback changedCallback;
  Input({this.hint, this.changedCallback});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Column(
                        children: [
                          Text('Name :'),
                          Text('Email : '),
                          Text('Phone : '),
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_view_day),
                title: Text('Time Table'),
              ),
              ListTile(
                leading: Icon(Icons.podcasts),
                title: Text('Posts'),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Cultural'),
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
