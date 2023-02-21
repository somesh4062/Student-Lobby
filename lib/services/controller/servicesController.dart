import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  RxString uploadImage = "".obs;
  RxList<dynamic> userHostel = [].obs;
  RxList<dynamic> userMess = [].obs;
  RxList<dynamic> userStationery = [].obs;
  RxList<dynamic> userSalon = [].obs;


  @override
  void onInit(){
    super.onInit();
    getUserServices();
  }

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
    //profileImage = image as File;
    final ref = FirebaseStorage.instance.ref().child("profileImages/"+serviceImage!.name.toString());
    await ref.putFile(File(serviceImage.path));
    ref.getDownloadURL().then((value) {
      debugPrint(value);
      uploadImage.value = value;
      update();
    });
    
    update();
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
      "uploadImage": uploadImage.value,
      "cityAsArray": convertToArray(city)
    };

    db.collection("hostel").add(hostel).then((ref) {
      userHostel.add(ref.id);
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"hostel": userHostel});
      Get.back();
      Fluttertoast.showToast(msg: "Registered Successfully");

      debugPrint(hostel.toString());
    }, onError: (obj) {
      debugPrint("Error");
    });
    getUserServices();
    update();
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
      "uploadImage": uploadImage.value,
      "cityAsArray": convertToArray(city)
    };

    db.collection("salon").add(salon).then((ref) {
      userSalon.add(ref.id);
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"salon": userSalon});
      Get.back();
      Fluttertoast.showToast(msg: "Registered Successfully");

      debugPrint(salon.toString());
    }, onError: (obj) {
      debugPrint("Error");
    });
    getUserServices();
    update();
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
      "uploadImage": uploadImage.value,
      "cityAsArray": convertToArray(city)
    };

    db.collection("stationery").add(stationery).then((ref) {
      userStationery.add(ref.id);
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"stationery": userStationery});
      Get.back();
      Fluttertoast.showToast(msg: "Registered Successfully");

      debugPrint(stationery.toString());
    }, onError: (obj) {
      debugPrint("Error");
    });
    getUserServices();
    update();
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
      "uploadImage": uploadImage.value,
      "cityAsArray": convertToArray(city)
    };

    db.collection("mess").add(mess).then((ref) {
      userMess.add(ref.id);
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"mess": userMess});
      Get.back();
      Fluttertoast.showToast(msg: "Registered Successfully");

      debugPrint(mess.toString());
    }, onError: (obj) {
      debugPrint("Error");
    });
    getUserServices();
    update();
  }
  
  void getUserServices()async {
    debugPrint("Called");
    var result = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).get();
    userHostel.value = result["hostel"];
    userMess.value=result["mess"];
    userStationery.value=result["stationery"];
    userSalon.value=result["salon"];
    debugPrint("Mess Count"+ userMess.length.toString());
    update();
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