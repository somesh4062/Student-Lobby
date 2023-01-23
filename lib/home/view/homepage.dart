import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/login&reg/controller/loginController.dart';
import 'package:student_lobby/widgets/widget.dart';

class HomePage extends GetView {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text("Hello Anirudh..", style: GoogleFonts.roboto(fontSize: 20,color: Colors.black),),
        leading: const Padding(
          padding: EdgeInsets.all(9.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.unsplash.com%2Fphoto-1529665253569-6d01c0eaf7b6%3Fixlib%3Drb-1.2.1%26ixid%3DeyJhcHBfaWQiOjEyMDd9%26w%3D1000%26q%3D80&f=1&nofb=1&ipt=1d3990d733d46acee4506828da2367aa60ae79e37b2cbe4febd6bb8d869972ab&ipo=images"),
            ),
        ),
        actions: [
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  signOut();
                },
                icon: const Icon(Icons.logout_rounded,color: Colors.black,)),
          )
        ],
      ),
      body: Column(
        children: [
          tabView()
        ],
      ),
    );
  }
}
