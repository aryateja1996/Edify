import 'package:edify/Theme.dart';
import 'package:edify/data/data.dart';
import 'package:flutter/material.dart';

class Syllabus extends StatefulWidget {
  @override
  _SyllabusState createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
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
        //1`2 color: Colors.orange,
        child: ListView.builder(
          itemBuilder: (context, i) {
            return Container(
              //color: Colors.blue,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.add_box_outlined),
                title: Text(subjects[5][i]),
                onTap: () {},
              ),
            );
          },
          itemCount: subjects[5].length,
        ),
      ),
    );
  }
}
