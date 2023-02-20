import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/services/controller/servicesController.dart';

import '../../widgets/widget.dart';

class SalonServiceRegister extends StatelessWidget {
  SalonServiceRegister({Key? key}) : super(key: key);
  ServicesController servicesController = Get.put(ServicesController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                        child: GetBuilder<ServicesController>(
                            init: ServicesController(),
                            builder: (controller) {
                              debugPrint("IN C" + controller.uploadImage.value);
                              return CachedNetworkImage(
                                imageUrl: controller.uploadImage.value,
                                errorWidget: (context, url, error) {
                                  return const Card(
                                      elevation: 7,
                                      child: Icon(CupertinoIcons.add));
                                },
                              );
                            }),
                      ),
                    )),
                textfield("Salon Name", servicesController.nameController,
                    false, true, Icon(Icons.cut), null),
                textfield("Owner Name", servicesController.ownerNameController,
                    false, true, Icon(Icons.person), null),
                textfield("Email", servicesController.emailController, false,
                    true, Icon(Icons.email), null),
                textfield("Contact", servicesController.contactController,
                    false, true, Icon(Icons.phone), null),
                textfield("Address", servicesController.addressController,
                    false, true, Icon(Icons.location_on), null),
                textfield("Area", servicesController.areaController, false,
                    true, Icon(Icons.area_chart), null),
                textfield("State", servicesController.stateController, false,
                    true, Icon(Icons.map), null),
                textfield("City", servicesController.cityController, false,
                    true, Icon(Icons.location_city), null),
                regularbtn("Register Service", onPressed)
              ],
            ),
          )),
        )),
      ),
    );
  }

  void onPressed() {
    if (_formKey.currentState!.validate()) {
      
        servicesController.registerSalonService(
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
}
