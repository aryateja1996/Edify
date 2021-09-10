import 'package:edify/Theme.dart';
import 'package:flutter/material.dart';

class Subject extends StatefulWidget {
  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Burger(),
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey,
        child: Center(
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return Container(
                color: Colors.lightBlue,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text('TextBook'),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    select(i + 1);
                  },
                ),
              );
            },
            itemCount: 3,
          ),
        ),
      ),
    );
  }

  select(int i) {
    switch (i) {
      case 1:
        print('one');
        break;
      case 2:
        print('two');
        break;
      case 3:
        print('3');
        break;
      default:
        print('default');
    }
  }
}
