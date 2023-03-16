import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/home/view/registeredServicesView.dart';
import 'package:student_lobby/services/controller/servicesController.dart';
import 'package:student_lobby/widgets/widget.dart';

class HomePage extends GetView {
  final db = FirebaseFirestore.instance;
  HomePage({Key? key}) : super(key: key);
  ServicesController servicesController = Get.put(ServicesController());
  @override
  Widget build(Object context) {
    return Scaffold(
        body: GetBuilder<ServicesController>(
            init: ServicesController(),
            builder: (controller) {
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => RegServicesView(
                                serviceType: ServiceType.HOSTEL,
                              ));
                        },
                        child: ListTile(
                          leading: Icon(Icons.hotel_sharp),
                          title: Text("Hostel"),
                          trailing:
                              Text(controller.userHostel.length.toString()),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => RegServicesView(
                                serviceType: ServiceType.MESS,
                              ));
                        },
                        child: ListTile(
                          leading: Icon(Icons.food_bank),
                          title: Text("Mess"),
                          trailing: Text(controller.userMess.length.toString()),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => RegServicesView(
                                serviceType: ServiceType.SALON,
                              ));
                        },
                        child: ListTile(
                          leading: Icon(Icons.cut),
                          title: Text("Salon"),
                          trailing:
                              Text(controller.userSalon.length.toString()),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => RegServicesView(
                                serviceType: ServiceType.STATIONERY,
                              ));
                        },
                        child: ListTile(
                          leading: Icon(Icons.store_mall_directory),
                          title: Text("Stationary"),
                          trailing:
                              Text(controller.userStationery.length.toString()),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }));
  }
}
