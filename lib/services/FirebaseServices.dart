import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edify/model/export.dart';
import 'package:edify/pages/exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:edify/Theme.dart';

FirebaseAuth fbAuth = FirebaseAuth.instance;

DatabaseReference fbDb = FirebaseDatabase.instance.reference();

FirebaseFirestore fbfs = FirebaseFirestore.instance;

FirebaseStorage fbs = FirebaseStorage.instance;

User user = fbAuth.currentUser;

Map<String, dynamic> data;

UserModel userModel;

DayOrder dayOrderModel;

login(String email, String pass, BuildContext context) async {
  print('=== Login function called===');
  String todaydate = date();
  FirebaseAuth fb = FirebaseAuth.instance;

  if (email != null && pass != null) {
    try {
      await fb.signInWithEmailAndPassword(email: email, password: pass);

      if (fb.currentUser != null) {
        DocumentSnapshot snapshot =
            await fbfs.collection('user').doc(user.uid).get();
        userModel = await UserModel.fromDocument(snapshot);
        print("+++++++  " + userModel.name + "  +++++++++");
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (builder) => Home()), (route) => false);
      }
    } catch (e) {
      showMyDialog(e.code, context);
    }
  } else {
    showMyDialog('Please Enter Details', context);
  }
}

signup(String name, String phone, String email, String pass, int sem,
    String cat, BuildContext context) async {
  print('=== SignUp function called===');
  String todaydate = date();
  FirebaseAuth fb = FirebaseAuth.instance;
  FirebaseFirestore fb2 = FirebaseFirestore.instance;
  if (name != null &&
      phone != null &&
      email != null &&
      pass != null &&
      sem != null) {
    try {
      await fb.createUserWithEmailAndPassword(email: email, password: pass);
      if (fb.currentUser != null) {
        User user = fb.currentUser;
        await fb2.collection('user').doc(user.uid).set({
          'name': name,
          'phone': phone,
          'email': email,
          'semester': sem,
          'cat': cat,
        });
        DocumentSnapshot snapshot =
            await fb2.collection('user').doc(user.uid).get();
        userModel = await UserModel.fromDocument(snapshot);
        print("+++++++  " + userModel.name + "  +++++++++");
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => Home()));
      }
    } catch (e) {
      showMyDialog(e.code, context);
    }
  } else {
    showMyDialog('Enter All Details', context);
  }
}

getDayOrder() async {
  DocumentSnapshot snapshot =
      await fbfs.collection('details').doc('dayorder').get();
  dayOrderModel = DayOrder.fromDataSnapShot(snapshot);
  print('++++++ ${dayOrderModel.dayorder} +++++');
}

getUserDetails() async {
  DocumentSnapshot snapshot = await fbfs.collection('user').doc(user.uid).get();
  userModel = await UserModel.fromDocument(snapshot);
  await getDayOrder();
  print("+++++++  " + userModel.sem.toString() + "  +++++++++");
}

class DayOrder {
  int dayorder;

  DayOrder({this.dayorder});

  factory DayOrder.fromDataSnapShot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data();
    String datetoday = date();
    return DayOrder(
      dayorder: data[datetoday],
    );
  }
}
