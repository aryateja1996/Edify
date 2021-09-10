import 'package:edify/Theme.dart';
import 'package:flutter/material.dart';

import 'exports.dart';

class Sub extends StatefulWidget {
  @override
  _SubState createState() => _SubState();
}

class _SubState extends State<Sub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Burger(),
      appBar: AppBar(
        title: Text('Subjects'),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.orange,
        child: ListView.builder(
          itemBuilder: (context, i) {
            return Container(
              color: Colors.blue,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.add_box_outlined),
                title: Text('Subjects'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Subject(),
                    ),
                  );
                },
              ),
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
