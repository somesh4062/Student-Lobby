import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/login&reg/controller/loginController.dart';

textfield(labelText) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextFormField(
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
            signInWithGoogle();
          } else if (btnText.toString() == "SignOut") {
            signOut();
          }
        },
        child: Text(btnText,
            style: GoogleFonts.montserrat(
                fontSize: 20, fontStyle: FontStyle.normal)),
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.yellow),
            minimumSize: MaterialStateProperty.all(const Size(250, 50)))),
  );
}

tabView() {
  return Card(
    child: SizedBox(
      
      height: Get.height*0.1,
      width: Get.width*0.2,
      child:  Image.network("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fgraphicsfamily.com%2Fwp-content%2Fuploads%2Fedd%2F2021%2F06%2FFood-Logo-Design-1-1536x864.jpg&f=1&nofb=1&ipt=9565eb1a757d951d1bbeff8a3c092a5ccb4670e8f2376c6755cd04c5efcc0f98&ipo=images"),
    ),
  );
}
