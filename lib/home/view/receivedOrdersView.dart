import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/product/controller/productController.dart';
import 'package:student_lobby/services/controller/servicesController.dart';

class ReceivedOrdersView extends StatelessWidget {
  ReceivedOrdersView({Key? key}) : super(key: key);
  ServicesController servicesController = Get.put(ServicesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Received Orders",
          style: GoogleFonts.acme(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: GetBuilder<ServicesController>(
          init: ServicesController(),
          builder: (controller) {
            if (controller.selectedOrders.length == 0) {
              return const Center(
                child: Text("No items to display"),
              );
            } else {
              return ListView(
                children: controller.selectedOrders.map((doc) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      isThreeLine: true,
                      leading: CachedNetworkImage(
                        imageUrl: doc["productImage"] ??
                            "https://cdn.pixabay.com/photo/2015/08/10/20/17/handbag-883122_1280.jpg",
                        errorWidget: (context, url, error) => CachedNetworkImage(
                            imageUrl:
                                "https://cdn.pixabay.com/photo/2016/11/23/18/14/fountain-pen-1854169_1280.jpg"),
                      ),
                      title: Text("Name: " + doc["name"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product Name: " + doc["productName"]),
                          Text("Price: " + doc["price"]),
                          Text("Contact: " + doc["contact"]),
                          doc.data().toString().contains("bookingTime")
                              ? Text("Booking Time: " + doc['bookingTime'])
                              : Container()
                        ],
                      ),
                      //trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    ),
                  );
                }).toList(),
              );
            }
          }),
    );
  }
}
