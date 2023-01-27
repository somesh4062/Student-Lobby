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
                    serviceTab("https://www.pngitem.com/pimgs/m/201-2011708_restaurant-symbol-of-cutlery-in-a-circle-restaurant.png", "Mess"),
                    serviceTab("https://media.istockphoto.com/id/1220134013/vector/s-h.jpg?s=612x612&w=0&k=20&c=FkvOnhQmfTV-4JJxkVUpYIaswj3iplKQ3J1lGM5vsTA=", "Salon")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    serviceTab("https://thumbs.dreamstime.com/b/vector-logo-icon-stationery-store-200396902.jpg", "Stationery"),
                    serviceTab("https://www.shutterstock.com/image-vector/hostel-academic-logo-template-260nw-1252532356.jpg", "Hostel")
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
