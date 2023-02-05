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
  RxString contact="".obs;
  RxString pass="".obs;

  saveData(String fieldName, String fieldValue){
    
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore.instance.collection('Users').doc(uid).update(
        {
         fieldName : fieldValue
        });
    update();
  }



}
