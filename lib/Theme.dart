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
  final VoidCallback callback;
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
