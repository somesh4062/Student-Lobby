import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/login_reg/controller/loginController.dart';
import 'package:student_lobby/widgets/widget.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
            height: Get.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/loginbackground.png'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GetBuilder(
                        init: LoginController(),
                        builder: (controller) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    loginController.getProfileImage();
                                  },
                                  child: CircleAvatar(
                                    foregroundColor: Colors.black,
                                    //backgroundColor: Colors.white30,
                                    child: loginController.profileImage == ""
                                        ? Icon(
                                            Icons.person_add_alt,
                                            color: Colors.grey,
                                          )
                                        : CircularProgressIndicator(),
                                    backgroundImage: NetworkImage(
                                        loginController.profileImage.value),
                                    radius: 40,
                                  ),
                                ),
                                textfield(
                                    "Name",
                                    loginController.nameController,
                                    false,
                                    true,
                                    Icon(Icons.person),
                                    null),
                                textfield(
                                    "Email",
                                    loginController.emailController,
                                    false,
                                    true,
                                    Icon(Icons.email),
                                    null),
                                textfield(
                                    "Phone Number",
                                    loginController.phonenumberController,
                                    false,
                                    true,
                                    Icon(Icons.phone),
                                    null),
                                textfield(
                                    "Password",
                                    loginController.passwordController,
                                    true,
                                    true,
                                    Icon(Icons.password),
                                    null),
                                regularbtn("Register", () {
                                  loginController.register(loginController.emailController.text, loginController.passwordController.text);
                                })
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
