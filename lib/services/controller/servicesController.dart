import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      hostelName, ownerName, rent, email, contact, state, city, area, address)async {
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

    db.collection("hostel").add(hostel).then((ref) {
      FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid).update(
        {"hostel":ref.id}
      );
      Get.back();
      Fluttertoast.showToast(msg: "Registered Successfully");

      debugPrint(hostel.toString());
      
    },onError: (obj){
      debugPrint("Error");
    } );
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