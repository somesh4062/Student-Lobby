import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widget.dart';

class StationeryRegisterView extends StatelessWidget {
  const StationeryRegisterView({Key? key}) : super(key: key);

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
                style: GoogleFonts.acme(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: 200,
                    height: 100,
                    child: InkWell(
                      onTap: () {
                        servicesController.getImage();
                      },
                      child: const Card(
                        elevation: 7,
                        child: Icon(CupertinoIcons.add),
                      ),
                    )),
              ),
              textfield("Stationery Name", servicesController.nameController,
                  false, true, Icon(Icons.store), null),
              textfield("Owner Name", servicesController.ownerNameController,
                  false, true, Icon(Icons.person), null),
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
    servicesController.registerStationeryService(
        servicesController.nameController.text,
        servicesController.ownerNameController.text,
        servicesController.emailController.text,
        servicesController.contactController.text,
        servicesController.stateController.text,
        servicesController.cityController.text,
        servicesController.areaController.text,
        servicesController.addressController.text);
  }
}
