import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/widgets/widget.dart';

class ServiceRegView extends StatelessWidget {
  const ServiceRegView({Key key}) : super(key: key);
  @override
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Service Provider",
                style: GoogleFonts.montserrat(fontSize: 30),
              ),
              textfield("Hostel Name", servicesController.hostelNameController,
                  false),
              textfield(
                  "Owner Name", servicesController.ownerNameController, false),
              textfield(
                  "Rent Per Month", servicesController.rentController, false),
              textfield("Email", servicesController.emailController, false),
              textfield("Contact", servicesController.contactController, false),
              textfield("Address", servicesController.addressController, false),
              textfield("Area", servicesController.areaController, false),
              textfield("State", servicesController.stateController, false),
              textfield("City", servicesController.cityController, false),
              regularbtn("Register Service")
            ],
          ),
        )),
      )),
    );
  }
}
