import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/widgets/widget.dart';

class HomePage extends GetView {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return Scaffold(
    
      body: GridView(
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
