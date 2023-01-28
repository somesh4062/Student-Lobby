import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController {
  TextEditingController hostelNameController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  registerService(
      hostelName, ownerName, rent, email, contact, state, city, area, address) {
    var db = FirebaseFirestore.instance;

    final hostel = {
      "name": hostelName,
      "ownerName": ownerName,
      "rent": rent,
      "email": email,
      "contact": contact,
      "state": state,
      "city": city,
      "area": area,
      "address": address
    };

    db.collection("hostel").add(hostel).then((value) => {
      Get.back(),
      Fluttertoast.showToast(msg: "Registered Successfully"),

      debugPrint(hostel.toString()),
      
    });
  }
}
