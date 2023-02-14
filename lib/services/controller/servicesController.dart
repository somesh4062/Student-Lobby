import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ServicesController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  //TextEditingController messNameController = TextEditingController();
  TextEditingController perMonthController = TextEditingController();
  TextEditingController perPlateController = TextEditingController();
  



  convertToArray(String str) {
    List arr = [];
    for (int i = 0; i <= str.length; i++) {
      arr.add(str.substring(0, i));
    }
    return arr;
  }

  getImage() async {
    final serviceImage =
        await ImagePicker.platform.getImage(source: ImageSource.gallery);
  }

  registerHostelService(name, ownerName, rent, email, contact, state, city,
      area, address) async {
    var db = FirebaseFirestore.instance;

    final hostel = {
      "name": name,
      "ownerName": ownerName,
      "rent": rent,
      "email": email,
      "contact": contact,
      "state": state,
      "city": city,
      "area": area,
      "address": address,
      "cityAsArray": convertToArray(city)
    };

    db.collection("hostel").add(hostel).then((ref) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"hostel": ref.id});
      Get.back();
      Fluttertoast.showToast(msg: "Registered Successfully");

      debugPrint(hostel.toString());
    }, onError: (obj) {
      debugPrint("Error");
    });
  }

registerSalonService(name, ownerName, email, contact, state, city,
      area, address) async {
    var db = FirebaseFirestore.instance;

    final salon = {
      "name": name,
      "ownerName": ownerName,
      "email": email,
      "contact": contact,
      "state": state,
      "city": city,
      "area": area,
      "address": address,
      "cityAsArray": convertToArray(city)
    };

    db.collection("salon").add(salon).then((ref) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"hostel": ref.id});
      Get.back();
      Fluttertoast.showToast(msg: "Registered Successfully");

      debugPrint(salon.toString());
    }, onError: (obj) {
      debugPrint("Error");
    });
  }

  registerStationeryService(name, ownerName,  email, contact, state, city,
      area, address) async {
    var db = FirebaseFirestore.instance;

    final stationery = {
      "name": name,
      "ownerName": ownerName,
      "email": email,
      "contact": contact,
      "state": state,
      "city": city,
      "area": area,
      "address": address,
      "cityAsArray": convertToArray(city)
    };

    db.collection("stationery").add(stationery).then((ref) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"hostel": ref.id});
      Get.back();
      Fluttertoast.showToast(msg: "Registered Successfully");

      debugPrint(stationery.toString());
    }, onError: (obj) {
      debugPrint("Error");
    });
  }




   registerMessService(name, ownerName, perMonth,perPlate, email, contact, state, city,
      area, address) async {
    var db = FirebaseFirestore.instance;

    final mess = {
      "name": name,
      "ownerName": ownerName,
      "perMonth": perMonth,
      "perPlate" : perPlate,
      "email": email,
      "contact": contact,
      "state": state,
      "city": city,
      "area": area,
      "address": address,
      "cityAsArray": convertToArray(city)
    };

    db.collection("mess").add(mess).then((ref) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"mess": ref.id});
      Get.back();
      Fluttertoast.showToast(msg: "Registered Successfully");

      debugPrint(mess.toString());
    }, onError: (obj) {
      debugPrint("Error");
    });
  }
}


// StreamBuilder<QuerySnapshot>(
//         stream: db.collection('hostel').where("name",isEqualTo: "Avengers Hostel").snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else
//             return ListView(
//               children: snapshot.data!.docs.map((doc) {
//                 return Card(
//                   child: ListTile(
//                     title: Text(doc.get('name')),
//                   ),
//                 );
//               }).toList(),
//             );
//         },
//       ),