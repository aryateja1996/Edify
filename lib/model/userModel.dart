import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String phone;
  final String email;
  final int sem;
  final String cat;

  UserModel({
    this.name,
    this.phone,
    this.email,
    this.sem,
    this.cat,
  });

  factory UserModel.fromDocument(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data();
    return UserModel(
      name: data['name'],
      phone: data['phone'],
      email: data['email'],
      sem: data['semester'],
      cat: data['cat'],
    );
  }
}
