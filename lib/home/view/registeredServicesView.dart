import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/services/controller/servicesController.dart';

enum ServiceType {
  HOSTEL,
  MESS,
  SALON,
  STATIONERY,
}

class RegServicesView extends StatelessWidget {
  ServiceType? serviceType;

  ServicesController servicesController = Get.put(ServicesController());

  RegServicesView({Key? key, this.serviceType}) : super(key: key);

  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registered Service",style: GoogleFonts.acme(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: SafeArea(
            child: GetBuilder<ServicesController>(
                init: ServicesController(),
                builder: (controller) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        FutureBuilder<List<DocumentSnapshot>>(
                            future: getStream(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data?.isEmpty ?? true) {
                                  debugPrint("Snap2");
                                  return Container(
                                    height: Get.height * 0.8,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text("No Items to display"),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return ListView.builder(
                                    itemCount: snapshot.data?.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 5, 10, 0),
                                          child: Card(
                                            elevation: 5,
                                            child: ListTile(
                                              leading: CachedNetworkImage(
                                                  height: 100,
                                                  width: 100,
                                                  imageUrl: snapshot
                                                          .data![index]
                                                          .data()
                                                          .toString()
                                                          .contains(
                                                              "uploadImage")
                                                      ? snapshot.data![index]
                                                          ["uploadImage"]
                                                      : "https://images.pexels.com/photos/13519033/pexels-photo-13519033.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                                              title: Text(
                                                  snapshot.data?[index]
                                                      ["name"]),
                                              subtitle: Text("Contact :" +
                                                  snapshot.data?[index]
                                                      ["contact"]),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    servicesController
                                                        .deleteUserService(
                                                            serviceType, index);
                                                    snapshot.data
                                                        ?.removeAt(index);
                                                  },
                                                  icon: Icon(Icons.delete)),
                                            ),
                                          ));
                                    });
                              } else {
                                return Center(
                                    child: const CircularProgressIndicator());
                              }
                            })
                      ],
                    ),
                  );
                })));
  }

  Future<List<DocumentSnapshot>> getStream() async {
    var data = <DocumentSnapshot>[];
    if (serviceType == ServiceType.HOSTEL) {
      for (int i = 0; i < servicesController.userHostel.length; i++) {
        data.add(await db
            .collection("hostel")
            .doc(servicesController.userHostel[i])
            .get());
      }
    } else if (serviceType == ServiceType.MESS) {
      for (int i = 0; i < servicesController.userMess.length; i++) {
        data.add(await db
            .collection("mess")
            .doc(servicesController.userMess[i])
            .get());
      }
    } else if (serviceType == ServiceType.SALON) {
      for (int i = 0; i < servicesController.userSalon.length; i++) {
        data.add(await db
            .collection("salon")
            .doc(servicesController.userSalon[i])
            .get());
      }
    } else {
      for (int i = 0; i < servicesController.userStationery.length; i++) {
        data.add(await db
            .collection("stationery")
            .doc(servicesController.userStationery[i])
            .get());
      }
    }

    return data;
  }
}
