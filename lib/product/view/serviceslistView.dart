import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/home/controller/searchViewController.dart';
import 'package:student_lobby/home/view/registeredServicesView.dart';

class ServicesListView extends StatelessWidget {
  ServiceType? serviceType = ServiceType.HOSTEL;

  ServicesListView({Key? key, this.serviceType});
  var db = FirebaseFirestore.instance;
  SearchViewController servicesController = Get.put(SearchViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchViewController>(
        init: SearchViewController(),
        builder: (controller) {
          String service =
              serviceType == ServiceType.HOSTEL ? "hostel" : "mess";
          //debugPrint("ST"+controller.searchText.value);
          return StreamBuilder<QuerySnapshot>(
            stream: db
                .collection(service)
                .where("cityAsArray",
                    arrayContains: controller.searchText.value)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      child: ListTile(
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.arrow_right)),
                        // visualDensity: VisualDensity(vertical: 5),
                        // minVerticalPadding: double.nan,
                        //horizontalTitleGap: double.negativeInfinity,
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          doc["name"],
                          style: GoogleFonts.acme(color: Colors.black),
                        ),
                        isThreeLine: true,
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Contact Number: " + doc["contact"].toString(),
                          style: GoogleFonts.acme(color: Colors.black),),
                            serviceType == ServiceType.HOSTEL
                                ? Text("Rent: " + doc["rent"],
                          style: GoogleFonts.acme(color: Colors.black),)
                                : Text("Per Month: " + doc["perMonth"],
                          style: GoogleFonts.acme(color: Colors.black),),
                            Text("Address: " + doc["address"],
                          style: GoogleFonts.acme(color: Colors.black),),
                            Text("City: " + doc["city"],
                          style: GoogleFonts.acme(color: Colors.black),),
                          ],
                        ),
                        leading: SizedBox(
                          child: CachedNetworkImage(
                            imageUrl: doc.get("uploadImage") ??
                                "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.UY0vt0ARKbq0EsA_-C4nVQHaE7%26pid%3DApi&f=1&ipt=f09a282b4a93aa83d743340b02074ea066a23920ab070767301bde447ccadad1&ipo=images",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            },
          );
        });
  }
}
