import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:student_lobby/home/controller/dashboardController.dart';
import 'package:student_lobby/home/view/dashboard.dart';
import 'package:student_lobby/home/view/dashboardbinding.dart';
import 'package:student_lobby/login_reg/view/login.dart';

class LoginController extends GetxController {

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phonenumber = TextEditingController();
TextEditingController password = TextEditingController();
signInWithGoogle() async {
  GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();

  GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken);
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  // Get.put(DashboardController());
  if (userCredential.user != null) {
    Get.to(() => Dashboard(),binding: DashboardBinding());
  }

  debugPrint(userCredential.user.displayName);
}

signOut() async {
  await GoogleSignIn().signOut();
  FirebaseAuth.instance.signOut();
  Get.to(() => Login());
}

}
