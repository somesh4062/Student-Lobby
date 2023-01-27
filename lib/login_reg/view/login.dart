import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/login_reg/controller/loginController.dart';
import 'package:student_lobby/widgets/widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 50),
              child: Text("WelCome in Student Lobby",
                  style: GoogleFonts.acme(fontSize: 45)),
            ),
            textfield( "Email",loginController.emailController,false  ),
            textfield("Password", loginController.password, true),
            regularbtn("Login"),
            regularbtn("Google Login")
          ],
        )),
      ),
    );
  }
}
