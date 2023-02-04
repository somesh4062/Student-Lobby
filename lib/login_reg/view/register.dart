import 'package:flutter/material.dart';
import 'package:student_lobby/widgets/widget.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                      children: [
            textfield("Name",loginController. nameController,false,true,Icon(Icons.person),null),
            textfield("Email",loginController. emailController,false,true, Icon(Icons.email),null),
            textfield("Phone Number",loginController. phonenumber,false,true,Icon(Icons.phone),null),
            textfield("Password",loginController. password, true,true, Icon(Icons.password),null),
            regularbtn("Register",null)
            
                      ],
                    ),
          )),
    );
  }
}
