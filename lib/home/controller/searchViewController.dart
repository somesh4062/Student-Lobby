import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController {
  TextEditingController searchController = TextEditingController();

  searchService(city) {
    var db = FirebaseFirestore.instance;

    final cityRef = db
        .collection("hostel")
        .where("city", isEqualTo: city)
        .get()
        .then((value) => {
          debugPrint(value.toString())
        });
    // final query = cityRef.where("city", isEqualTo: city).get().then((value) => {
    //       //  debugPrint(city),
    //       debugPrint(value.toString())
    //     });
  }
}
