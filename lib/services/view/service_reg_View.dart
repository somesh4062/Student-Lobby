import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/widgets/widget.dart';

class ServiceRegView extends StatelessWidget {
  const ServiceRegView({Key? key}) : super(key: key);
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
                  false, true, Icon(Icons.hotel), null),
              textfield("Owner Name", servicesController.ownerNameController,
                  false, true, Icon(Icons.person), null),
              textfield("Rent Per Month", servicesController.rentController,
                  false, true, Icon(Icons.currency_rupee), null),
              textfield("Email", servicesController.emailController, false,
                  true, Icon(Icons.email), null),
              textfield("Contact", servicesController.contactController, false,
                  true, Icon(Icons.phone), null),
              textfield("Address", servicesController.addressController, false,
                  true, Icon(Icons.location_on), null),
              textfield("Area", servicesController.areaController, false, true,
                  Icon(Icons.area_chart), null),
              textfield("State", servicesController.stateController, false,
                  true, Icon(Icons.map), null),
              textfield("City", servicesController.cityController, false, true,
                  Icon(Icons.location_city), null),
              regularbtn("Register Service", onPressed)
            ],
          ),
        )),
      )),
    );
  }

  void onPressed() {
    servicesController.registerService(
        servicesController.hostelNameController.text,
        servicesController.ownerNameController.text,
        servicesController.rentController.text,
        servicesController.emailController.text,
        servicesController.contactController.text,
        servicesController.stateController.text,
        servicesController.cityController.text,
        servicesController.areaController.text,
        servicesController.addressController.text);
  }
}
