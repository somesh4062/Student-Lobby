import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/home/controller/profileController.dart';
import 'package:student_lobby/login_reg/controller/loginController.dart';
import 'package:student_lobby/login_reg/view/register.dart';
import 'package:student_lobby/services/view/service_reg_View.dart';

import '../home/controller/searchViewController.dart';
import '../services/controller/servicesController.dart';

LoginController loginController = Get.put(LoginController());
ServicesController servicesController = Get.put(ServicesController());
SearchViewController searchViewController = Get.put(SearchViewController());

textfield(labelText, textController, bool type, bool editable, Icon? prefixicon,
    Icon? suffixIcon) {
  return CustomTextField(labelText: labelText,textController: textController,type: type,editable: editable,prefixIcon: prefixicon,
    suffixIcon: suffixIcon);
}

class CustomTextField extends StatefulWidget {

  String? labelText;

  TextEditingController? textController;

  bool? type;

  bool? editable; 

  Icon? prefixIcon;

  Icon? suffixIcon;

  void Function (String)?  onSubmit;

  CustomTextField({
    this.labelText, this.textController, this.type, this.editable, this.prefixIcon,
    this.suffixIcon, this.onSubmit,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  ProfileController profileController=Get.put(ProfileController());
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: TextFormField(
        onFieldSubmitted: widget.onSubmit,
        obscureText: widget.type??false,
        controller: widget.textController,
        decoration: InputDecoration(
            prefixIcon:widget.prefixIcon,
            suffixIcon: IconButton(
                onPressed: () {
                  
                  debugPrint("Pressed");
                  setState(() {
                    // widget.editable=widget.editable??false;
                    widget.editable=widget.editable!=true?true:false;
                  });
                },
                icon: widget.suffixIcon ?? const Icon(
                        Icons.stop,
                        color: Colors.white,
                      )),
            border: const OutlineInputBorder(),
            labelText: widget.labelText),
      ),
    );
  }
}

regularbtn(String btnText,void Function () ? onPressed) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: ElevatedButton(
        onPressed: onPressed,//() {
          // if (btnText.toString() == "Google Login") {
          //   loginController.signInWithGoogle();
          // } else if (btnText.toString() == "SignOut") {
          //   loginController.signOut();
          // } else if (btnText.toString() == "Register") {
          //   loginController.register(loginController.emailController.text,
          //       loginController.password.text);
          // } else if (btnText.toString() == "Register Service") {
          //   servicesController.registerService(
          //       servicesController.hostelNameController.text,
          //       servicesController.ownerNameController.text,
          //       servicesController.rentController.text,
          //       servicesController.emailController.text,
          //       servicesController.contactController.text,
          //       servicesController.stateController.text,
          //       servicesController.cityController.text,
          //       servicesController.areaController.text,
          //       servicesController.addressController.text);
          // } else if (btnText.toString() == "Search") {
          //   searchViewController
          //       .searchService(searchViewController.searchController.text);
          // }
        // },
        child: Text(btnText,
            style: GoogleFonts.montserrat(
              color: Colors.black,
                fontSize: 20, fontStyle: FontStyle.normal)),
        style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.white,
                 
                // side: BorderSide(color: Colors.black, width: 1),
                 elevation: 08,
                 minimumSize: const Size(150,50),
                 shadowColor: Colors.teal,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
               ),),
  );
}

// tabView() {
//   return Center(
//     child: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Card(
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//         elevation: 4.0,
//         child: Container(
//           decoration: ShapeDecoration(shape: CircleBorder()),
//           height: Get.height * 0.2,
//           width: Get.width * 0.4,
//           child: Image.network(
//             "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fgraphicsfamily.com%2Fwp-content%2Fuploads%2Fedd%2F2021%2F06%2FFood-Logo-Design-1-1536x864.jpg&f=1&nofb=1&ipt=9565eb1a757d951d1bbeff8a3c092a5ccb4670e8f2376c6755cd04c5efcc0f98&ipo=images",
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     ),
//   );
// }

serviceTab(imageUrl, label) {
  return InkWell(
    onTap: () {
      if (label.toString() == "Hostel") {
        servicesController.addressController.clear();
        servicesController.hostelNameController.clear();
        servicesController.ownerNameController.clear();
        servicesController.rentController.clear();
        servicesController.emailController.clear();
        servicesController.contactController.clear();
        servicesController.stateController.clear();
        servicesController.cityController.clear();
        servicesController.areaController.clear();
        servicesController.addressController.clear();
        Get.to(() => ServiceRegView());
      }
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 2))
                ]),
            height: Get.height * 0.2,
            width: Get.width * 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: imageUrl.toString() == null
                  ? const CircularProgressIndicator(color: Colors.black)
                  : Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: GoogleFonts.montserrat(fontSize: 20),
            ),
          )
        ],
      ),
    ),
  );
}
