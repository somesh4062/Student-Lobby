import 'package:flutter/material.dart';
import 'package:student_lobby/widgets/widget.dart';

class Register extends StatelessWidget {
  const Register({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
              child: Column(
            children: [
              textfield("Name",loginController. nameController,false),
              textfield("Email",loginController. emailController,false),
              textfield("Phone Number",loginController. phonenumber,false),
              textfield("Password",loginController. password, true),
              regularbtn("Register")
              
            ],
          )),
        ),
      ),
    );
  }
}
