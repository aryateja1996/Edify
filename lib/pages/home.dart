import 'package:edify/Theme.dart';
import 'package:edify/data/data.dart';
import 'package:edify/pages/exports.dart';
import 'package:edify/services/export.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
    String d = date();

    if (dayOrderModel.dayorder == null) {
      print(true);
    } else {
      print(false);
    }

    int todayDayOrder =
        dayOrderModel.dayorder == null ? dayOrder[d] : dayOrderModel.dayorder;
    return Scaffold(
      drawer: Burger(),
      appBar: AppBar(
        centerTitle: true,
        title:
            todayDayOrder == 0 ? Text('Holiday') : Text('Day $todayDayOrder'),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 100,
        //color: Colors.black,
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, i) {
            return InkWell(
              child: ClipRect(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 7),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  margin:
                      EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: Image(
                          fit: BoxFit.fill,
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
              ),
              onTap: () {
                getDayOrder();
                //print('++++++++ ${data[date]}  +++++++++++');
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => arr[i]));
              },
            );
          },
          itemCount: 6,
        ),
      ),
    );
  }
}
