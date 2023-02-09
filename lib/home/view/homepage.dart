import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/widgets/widget.dart';

class HomePage extends GetView {
  final db = FirebaseFirestore.instance;
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(Object context) {
    return Scaffold(
        body: ListView(
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.hotel_sharp),
              title: Text("Hostel"),
              trailing: Text("3"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.food_bank),
              title: Text("Mess"),
              trailing: Text("2"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10,right: 10, top: 10),
          child: Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.cut),
              title: Text("Salon"),
              trailing: Text("5"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10,right: 10, top: 10),
          child: Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.store_mall_directory),
              title: Text("Stationary"),
              trailing: Text("4"),
            ),
          ),
        )
      ],
    ));
  }
}
