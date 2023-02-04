import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:student_lobby/widgets/widget.dart';

class ProfileView extends GetView {
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

            textfield("Name", loginController.nameController, false,false, Icon(Icons.person), Icon(Icons.edit)),
            textfield("Email", loginController.emailController, false,false,Icon(Icons.email), Icon(Icons.edit)),
            textfield("Contact", loginController.phonenumber, false,false,Icon(Icons.phone), Icon(Icons.edit)),
            textfield("Password", loginController.password, true, false, Icon(Icons.password), Icon(Icons.edit))

          ],
        ),
      ),
    );
  }
}
