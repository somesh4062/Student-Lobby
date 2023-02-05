import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:student_lobby/home/controller/profileController.dart';
import 'package:student_lobby/widgets/widget.dart';

class ProfileView extends GetView {
  ProfileController profileController =Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children:  [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/1855582/pexels-photo-1855582.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", ),radius: 40,
              ),
            ),

            CustomTextField(
              labelText: "Name", 
              textController: profileController.nameController,
              editable: true,type: false,
              prefixIcon: Icon(Icons.person),
              suffixIcon: Icon(Icons.edit),
              onSubmit: (value){
                profileController.name.value = value;
                profileController.saveData("Name", value);
                
              },
            ),
            CustomTextField(
              labelText: "Email", 
              textController: profileController.emailController,
              editable: true,type: false,
              prefixIcon: Icon(Icons.email),
              suffixIcon: Icon(Icons.edit),
              onSubmit: (value){
                profileController.name.value = value;
                profileController.saveData("Email", value);
                
              },
            ),
            CustomTextField(
              labelText: "Contact", 
              textController: profileController.phonenumberController,
              editable: true,type: false,
              prefixIcon: Icon(Icons.phone),
              suffixIcon: Icon(Icons.edit),
              onSubmit: (value){
                profileController.name.value = value;
                profileController.saveData("Contact", value);
                
              },
            ),

            CustomTextField(
              labelText: "Password", 
              textController: profileController.passwordController,
              editable: true,type: true,
              prefixIcon: Icon(Icons.password),
              suffixIcon: Icon(Icons.edit),
              onSubmit: (value){
                profileController.name.value = value;
                profileController.saveData("Password", value);
              },
            ),

            // textfield("Email", profileController.emailController, false,true,Icon(Icons.email), Icon(Icons.edit)),
            // textfield("Contact", profileController.phonenumber, false,true,Icon(Icons.phone), Icon(Icons.edit)),
            // textfield("Password", profileController.password, true, true, Icon(Icons.password), Icon(Icons.edit))

          ],
        ),
      ),
    );
  }
}
