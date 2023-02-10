import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString name="".obs;
  RxString email="".obs;
  RxString phone="".obs;
  RxString pass="".obs;
  RxString profileImage="".obs;

  saveData(String fieldName, String fieldValue){
    
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore.instance.collection('Users').doc(uid).update(
        {
         fieldName : fieldValue
        });
    update();
  }

  getData()async{
    String uid= FirebaseAuth.instance.currentUser?.uid??"";
    DocumentSnapshot userData = await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    debugPrint("UID"+uid);
    nameController.text = userData["name"];
    name.value = userData["name"];
    emailController.text = userData["email"];
    email.value = userData["email"];
    phonenumberController.text = userData["phone"];
    phone.value = userData["phone"];
    profileImage.value = userData["profileImage"];
    debugPrint(profileImage.value);
    update();
  }

}
