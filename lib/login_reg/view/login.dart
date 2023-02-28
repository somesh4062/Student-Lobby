import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/login_reg/controller/loginController.dart';
import 'package:student_lobby/login_reg/view/register.dart';
import 'package:student_lobby/login_reg/view/sellerLoginView.dart';
import 'package:student_lobby/login_reg/view/studentLoginView.dart';
import 'package:student_lobby/widgets/widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  LoginController loginController = Get.put(LoginController());

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
                      // color: Colors.white,
                      //shadowColor: Colors.white,
                      elevation: 30,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 25),
                        child: Column(
                          children: [
                            Text(
                              "Login as per your preference ",
                              style: GoogleFonts.acme(
                                  fontSize: Get.size.aspectRatio * 35),
                            ),

                            InkWell(
                              onTap: () {
                                Get.to(() => StudentLoginView());
                                //loginController.signInWithGoogle();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(60, 10, 60, 10),
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 20, 30, 8),
                                          child: Icon(
                                            Icons.school,
                                            size: 80,
                                          )
                                          //CachedNetworkImage(imageUrl: "https://cdn.pixabay.com/photo/2022/01/11/21/18/icon-6931522_1280.png"),
                                          ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "As Student",
                                          style: GoogleFonts.acme(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => SellerLoginView());
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 10, 80, 10),
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 20, 30, 8),
                                          child: Icon(
                                            Icons.store,
                                            size: 80,
                                          )
                                          //CachedNetworkImage(imageUrl: "https://cdn.pixabay.com/photo/2022/01/11/21/18/icon-6931522_1280.png"),
                                          ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "As Service Provider",
                                          style: GoogleFonts.acme(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            //               textfield("Email", loginController.emailController, false,
                            // true, const Icon(Icons.email_outlined), null),
                            //               textfield("Password", loginController.passwordController,
                            // true, true, const Icon(Icons.password_outlined), null),

                            //                 Padding(
                            // padding: const EdgeInsets.only(
                            //     left: 25, right: 25, top: 15, bottom: 25),
                            // child: Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     InkWell(
                            //       onTap: () {
                            //         loginController.signInWithGoogle();
                            //       },
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(50),
                            //             color: Colors.white,
                            //             boxShadow: [
                            //               BoxShadow(
                            //                   color: Colors.grey.withOpacity(0.5),
                            //                   spreadRadius: 2,
                            //                   blurRadius: 7,
                            //                   offset: const Offset(0, 2))
                            //             ]),
                            //         width: Get.width * 0.5,
                            //         height: Get.height * 0.06,
                            //         child: Row(
                            //           children: [
                            //             Padding(
                            //               padding: const EdgeInsets.only(left: 15),
                            //               child: SizedBox(
                            //                   width: Get.width * 0.1,
                            //                   height: Get.height * 0.05,
                            //                   child: Image.network(
                            //                     'https://pngimg.com/uploads/google/google_PNG19635.png',
                            //                     fit: BoxFit.scaleDown,
                            //                   )),
                            //             ),
                            //             const Text("Sign-in With Google")
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //     InkWell(
                            //         onTap: () {
                            //           loginController.login(
                            //               loginController.emailController.text,
                            //               loginController.passwordController.text);
                            //         },
                            //         child: Container(
                            //             decoration: BoxDecoration(
                            //                 borderRadius: BorderRadius.circular(100),
                            //                 color: Colors.white,
                            //                 boxShadow: [
                            //                   BoxShadow(
                            //                       color: Colors.grey.withOpacity(0.5),
                            //                       spreadRadius: 2,
                            //                       blurRadius: 7,
                            //                       offset: const Offset(0, 2))
                            //                 ]),
                            //             width: Get.width * 0.1,
                            //             height: Get.height * 0.05,
                            //             child: const Icon(
                            //               Icons.arrow_forward_rounded,
                            //               size: 25,
                            //             )))
                            //   ],
                            // ),
                            //                 ),
                            //                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            // Text(
                            //   "Want to Register Service?  ",
                            //   style: GoogleFonts.montserrat(),
                            // ),
                            // InkWell(
                            //   onTap: (() => Get.to(() => Register())),
                            //   child: Text(
                            //     "Register",
                            //     style: GoogleFonts.montserrat(color: Colors.blue),
                            //   ),
                            // )
                            //                 ])
                          ],
                        ),
                      ),
                    ),
                  ),
                  //  regularbtn("Login"),
                  //  regularbtn("Google Login"),
                  // regularbtn("Register")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
