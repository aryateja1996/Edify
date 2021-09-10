import 'package:edify/Theme.dart';
import 'package:edify/pages/exports.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> arr = [
      Sub(),
      Syllabus(),
      Cultural(),
      Questions(),
      Post(),
      Queries(),
    ];
    List<String> name = [
      'Subjects',
      'Syllabus',
      'Cultural',
      'Questions',
      'Posts',
      'Queries',
    ];
    List<String> img = [
      'subject.png',
      'syllabus.png',
      'cultural.jpg',
      'ques.jpg',
      'post.jpg',
      'queries.png',
    ];
    return Scaffold(
      drawer: Burger(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Day Order 1'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 80,
            //color: Colors.black,
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, i) {
                return InkWell(
                  child: Container(
                    width: 150,
                    height: 150,
                    //color: Colors.blue,
                    margin:
                        EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          child: Image(
                            image: AssetImage(
                              'assets/${img[i]}',
                            ),
                            width: 190,
                            height: 190,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Positioned(
                            bottom: 10,
                            child: Text(
                              name[i],
                              style: TextStyle(fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => arr[i]));
                  },
                );
              },
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
