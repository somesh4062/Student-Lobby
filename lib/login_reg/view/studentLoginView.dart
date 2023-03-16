import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/widgets/widget.dart';

class StudentLoginView extends StatelessWidget {
  const StudentLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/loginbackground.png'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(children: [
                        Text(
                          "Login As Student",
                          style: GoogleFonts.acme(),
                        ),
                        textfield("Email", loginController.emailController,
                            false, true, const Icon(Icons.email_outlined), null),
                        textfield(
                            "Password",
                            loginController.passwordController,
                            true,
                            true,
                            const Icon(Icons.password_outlined),
                            null),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 15, bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  loginController.signInWithGoogle();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: const Offset(0, 2))
                                      ]),
                                  width: Get.width * 0.5,
                                  height: Get.height * 0.06,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: SizedBox(
                                            width: Get.width * 0.1,
                                            height: Get.height * 0.05,
                                            child: Image.network(
                                              'https://pngimg.com/uploads/google/google_PNG19635.png',
                                              fit: BoxFit.scaleDown,
                                            )),
                                      ),
                                      Text(
                                        "Sign-in With Google",
                                        style: GoogleFonts.acme(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    loginController.login(
                                        loginController.emailController.text,
                                        loginController
                                            .passwordController.text);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: const Offset(0, 2))
                                          ]),
                                      width: Get.width * 0.1,
                                      height: Get.height * 0.05,
                                      child: const Icon(
                                        Icons.arrow_forward_rounded,
                                        size: 25,
                                      )))
                            ],
                          ),
                          // regularbtn("Login", (){
                          //   loginController.login(loginController.emailController.text, loginController.passwordController.text);
                          // }),

                          // Padding(
                          //   padding: const EdgeInsets.all(10.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Text("Want to Register Service? ",style: GoogleFonts.acme(),),
                          //       InkWell(
                          //         onTap: () {
                          //           Get.to(()=> Register());
                          //         },
                          //         child: Text(" Register",style: GoogleFonts.acme(color: Colors.blue),))

                          //     ],
                          //   ),
                          // )
                        )
                      ]),
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
