import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_lobby/home/view/dashboard.dart';
import 'package:student_lobby/home/view/dashboardbinding.dart';
import 'package:student_lobby/login_reg/view/login.dart';

class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString profileImage = "".obs;
  // dynamic backgroundImage;

  // @override
  // void initState() async {
  //   final storageRef = FirebaseStorage.instance.ref();
  //   backgroundImage =
  //       await storageRef.child("loginbackground.png").getDownloadURL();
  //   debugPrint(backgroundImage.toString());
  // }

  signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    AuthCredential? credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Get.put(DashboardController());
    if (userCredential.user != null) {
      var result = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user?.uid)
          .get();

      if (!result.exists) ;
      {
        FirebaseFirestore.instance
            .collection('Users')
            .doc(userCredential.user?.uid)
            .set({
          'name': userCredential.user?.displayName,
          'uid': userCredential.user?.uid
        });
      }
      Get.to(() => Dashboard(), binding: DashboardBinding());
    }

    debugPrint(userCredential.user?.displayName);
  }

  signOut() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    Get.to(() => Login());
  }

  login(email, password) async {


    try {
      UserCredential auth = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => {
                debugPrint(email + " " + password),
                Get.to(() => Dashboard()),
                Fluttertoast.showToast(msg: "Successfully Logged In")
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e.toString());
      });
      FirebaseFirestore.instance
          .collection('Users')
          .doc(auth.user?.uid)
          .set({'name':nameController.text??auth.user?.displayName, 'uid': auth.user?.uid});
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  register(email, password) async{
    Map<String,dynamic> userData ={};
    try {
      final credential =await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => {
                debugPrint(email + " " + password),
                Get.to(() => Dashboard()),
                Fluttertoast.showToast(msg: "Successfully Logged In")
                
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e.toString());
      });
      userData.addAll({'name':nameController.text?? credential.user?.displayName, 'uid': credential.user?.uid,"phone":phonenumberController.text,"email":emailController.text,"profileImage":profileImage.value});

      FirebaseFirestore.instance
          .collection('Users')
          .doc(credential.user?.uid)
          .set(userData);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak ");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The Account already exists for that email. ");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  getProfileImage() async {
    final image =
        await ImagePicker.platform.getImage(source: ImageSource.gallery);
    //profileImage = image as File;
    final ref = FirebaseStorage.instance.ref().child("profileImages/"+image!.name.toString());
    await ref.putFile(File(image.path));
    ref.getDownloadURL().then((value) {
      debugPrint(value);
      profileImage.value = value;
      update();
    });
    update();
  }
}
