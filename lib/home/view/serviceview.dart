import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/widgets/widget.dart';

class ServicesView extends GetView {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    serviceTab(Icons.dining, "Mess"),
                    serviceTab(Icons.cut, "Salon")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    serviceTab(Icons.store_mall_directory, "Stationery"),
                    serviceTab(Icons.hotel_sharp, "Hostel")
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
