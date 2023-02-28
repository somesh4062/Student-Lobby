import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/login_reg/view/register.dart';
import 'package:student_lobby/widgets/widget.dart';

class SellerLoginView extends StatelessWidget {
  const SellerLoginView({Key? key}) : super(key: key);

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
                      padding: const EdgeInsets.only(top: 20,bottom: 20),
                      child: Column(
                        children: [
                          Text("Login As Service Provider",style: GoogleFonts.acme(),),
                          textfield("Email", loginController.emailController,
                              false,
                              true, 
                              const Icon(Icons.email_outlined), 
                              null),
                          textfield(
                              "Password",
                              loginController.passwordController,
                              true,
                              true,
                              const Icon(Icons.password_outlined),
                              null),
                              regularbtn("Login", (){
                                loginController.login(loginController.emailController.text, loginController.passwordController.text);
                              }),

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Want to Register Service? ",style: GoogleFonts.acme(),),
                                    InkWell(
                                      onTap: () {
                                        Get.to(()=> Register());
                                      },
                                      child: Text(" Register",style: GoogleFonts.acme(color: Colors.blue),))

                                  ],
                                ),
                              )
                        ],
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
