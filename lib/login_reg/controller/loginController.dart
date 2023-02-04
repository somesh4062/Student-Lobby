import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:student_lobby/home/view/dashboard.dart';
import 'package:student_lobby/home/view/dashboardbinding.dart';
import 'package:student_lobby/login_reg/view/login.dart';

class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
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
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => {
                debugPrint(email + " " + password),
                Get.to(() => Dashboard()),
                Fluttertoast.showToast(msg: "Successfully Logged In")
              })
          .catchError((e) {
      Fluttertoast.showToast(msg: e.toString());      
          });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  register(email, password) {
    try {
      final credential = FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      credential.whenComplete(() => {
            Get.to(() => Dashboard()),
            Fluttertoast.showToast(msg: "Registered Successfully. ")
          });
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
}
