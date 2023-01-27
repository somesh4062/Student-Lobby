import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/login_reg/controller/loginController.dart';

LoginController loginController = Get.put(LoginController());
textfield(labelText, textController, bool type) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextFormField(
      obscureText: type,
      controller: textController,
      decoration: InputDecoration(labelText: labelText),
    ),
  );
}

regularbtn(btnText) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: ElevatedButton(
        onPressed: () {
          if (btnText.toString() == "Google Login") {
           loginController.signInWithGoogle();
          } else if (btnText.toString() == "SignOut") {
           loginController.signOut();
          }
        },
        child: Text(btnText,
            style: GoogleFonts.montserrat(
                fontSize: 20, fontStyle: FontStyle.normal)),
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.yellow),
            minimumSize: MaterialStateProperty.all(Size(250, 50)))),
  );
}

tabView() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 4.0,
        child: Container(
          decoration: ShapeDecoration(shape: CircleBorder()),
          height: Get.height * 0.2,
          width: Get.width * 0.4,
          child: Image.network(
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fgraphicsfamily.com%2Fwp-content%2Fuploads%2Fedd%2F2021%2F06%2FFood-Logo-Design-1-1536x864.jpg&f=1&nofb=1&ipt=9565eb1a757d951d1bbeff8a3c092a5ccb4670e8f2376c6755cd04c5efcc0f98&ipo=images",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
