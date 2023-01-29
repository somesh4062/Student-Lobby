import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:student_lobby/home/model/serviceModel.dart';

class SearchViewController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Future<List<ServiceModel>> searchService(city) async {
    var db = FirebaseFirestore.instance;
    final snapshot =
        await db.collection("hostel").where("city", isEqualTo: city).get();
    final servicedata =
        snapshot.docs.map((e) => ServiceModel.fromSnapshot(e)).toList();
    debugPrint(servicedata.toString());
    return servicedata;
    // var details;
    // final cityRef = db.collection("hostel");

    // final query = cityRef.where("city", isEqualTo: city).get().then((value) => {
    //       //  debugPrint(city),
    //       debugPrint(value.toString())
    //     });
  }
}
