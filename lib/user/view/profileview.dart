import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:student_lobby/login_reg/controller/loginController.dart';
import 'package:student_lobby/user/controller/profileController.dart';
import 'package:student_lobby/widgets/widget.dart';

class ProfileView extends GetView {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    profileController.getData();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GetBuilder(
                  init: LoginController(),
                  builder: (controller) {
                    return InkWell(
                        onTap: () {
                          loginController.getProfileImage();
                        },
                        child: CircleAvatar(
                          backgroundImage: loginController.profileImage != null
                              ? CachedNetworkImageProvider(
                                  loginController.profileImage.value)
                              : const CachedNetworkImageProvider(
                                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),

                          // NetworkImage(
                          //   loginController.profileImage.value,
                          // ),
                          radius: 40,
                        ));
                  },
                ),
              ),

              CustomTextField(
                labelText: "Name",
                textController: profileController.nameController,
                editable: true,
                type: false,
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.edit),
                onSubmit: (value) {
                  profileController.name.value = value;
                  profileController.saveData("name", value);
                },
              ),
              CustomTextField(
                labelText: "Email",
                textController: profileController.emailController,
                editable: true,
                type: false,
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.edit),
                onSubmit: (value) {
                  profileController.email.value = value;
                  profileController.saveData("email", value);
                },
              ),
              CustomTextField(
                labelText: "Contact",
                textController: profileController.phonenumberController,
                editable: true,
                type: false,
                prefixIcon: Icon(Icons.phone),
                suffixIcon: Icon(Icons.edit),
                onSubmit: (value) {
                  profileController.name.value = value;
                  profileController.saveData("phone", value);
                },
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomTextField(
                  labelText: "Password",
                  textController: profileController.passwordController,
                  editable: true,
                  type: true,
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.edit),
                  onSubmit: (value) {
                    profileController.name.value = value;
                    profileController.saveData("password", value);
                  },
                ),
              ),
              regularbtn("Save", () {})

              // textfield("Email", profileController.emailController, false,true,Icon(Icons.email), Icon(Icons.edit)),
              // textfield("Contact", profileController.phonenumber, false,true,Icon(Icons.phone), Icon(Icons.edit)),
              // textfield("Password", profileController.password, true, true, Icon(Icons.password), Icon(Icons.edit))
            ],
          ),
        ),
      ),
    );
  }
}
