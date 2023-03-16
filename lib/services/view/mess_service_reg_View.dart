import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/services/controller/servicesController.dart';

import '../../widgets/widget.dart';

class MessServiceRegister extends StatelessWidget {
  MessServiceRegister({Key? key}) : super(key: key);

  ServicesController servicesController = Get.put(ServicesController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Mess Service",
            style: GoogleFonts.acme(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Text(
                //   "Service Provider",
                //   style: GoogleFonts.acme(fontSize: 20),
                // ),
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
                      )),
                ),
                textfield("Mess Name", servicesController.nameController, false,
                    true, const Icon(Icons.food_bank), null),
                textfield("Owner Name", servicesController.ownerNameController,
                    false, true, const Icon(Icons.person), null),
                textfield("Per-Month", servicesController.perMonthController,
                    false, true, const Icon(Icons.currency_rupee), null),
                textfield("Per-Plate", servicesController.perPlateController,
                    false, true, const Icon(Icons.currency_rupee), null),
                textfield("Email", servicesController.emailController, false,
                    true, const Icon(Icons.email), null),
                textfield("Contact", servicesController.contactController,
                    false, true, const Icon(Icons.phone), null),
                textfield("Address", servicesController.addressController,
                    false, true, const Icon(Icons.location_on), null),
                textfield("Area", servicesController.areaController, false,
                    true, const Icon(Icons.area_chart), null),
                textfield("State", servicesController.stateController, false,
                    true, const Icon(Icons.map), null),
                textfield("City", servicesController.cityController, false,
                    true, const Icon(Icons.location_city), null),
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
      servicesController.registerMessService(
          servicesController.nameController.text,
          servicesController.ownerNameController.text,
          servicesController.perMonthController.text,
          servicesController.perPlateController.text,
          servicesController.emailController.text,
          servicesController.contactController.text,
          servicesController.stateController.text,
          servicesController.cityController.text,
          servicesController.areaController.text,
          servicesController.addressController.text);
    }
  }
}
