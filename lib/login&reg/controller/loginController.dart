import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:student_lobby/home/view/dashboard.dart';
import 'package:student_lobby/login&reg/view/login.dart';

signInWithGoogle() async {
  GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();

  GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken);
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  if (userCredential.user != null) {
    Get.to(()=> Dashboard());
  }

  debugPrint(userCredential.user.displayName);
}

signOut() async {
  await GoogleSignIn().signOut();
  FirebaseAuth.instance.signOut();
  Get.to(()=> const Login());
}
