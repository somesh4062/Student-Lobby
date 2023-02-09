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
    
      body: 
      GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: Get.width,
          mainAxisExtent: 120
        ),
        children: [
          
        ],

      ),
    );
  }
}
