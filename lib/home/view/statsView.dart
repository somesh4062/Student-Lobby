import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsView extends StatelessWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Growth",style: GoogleFonts.acme(color: Colors.black),),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon:const Icon( Icons.arrow_back,color: Colors.black,)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: SizedBox(
                      width: Get.width * 0.8,
                      //height: Get.height,
                      child: Image.asset('assets/images/growth_march.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Your Total Order of this month: 1",
                    style: GoogleFonts.acme(),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
