import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/product/controller/productController.dart';
import 'package:student_lobby/widgets/widget.dart';

class SalonOrderView extends StatelessWidget {
  SalonOrderView({Key? key}) : super(key: key);

  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                labelText: "FullName",
                prefixIcon: Icon(Icons.abc),
                textController: productController.nameController,
              ),
              CustomTextField(
                labelText: "Contact",
                prefixIcon: Icon(Icons.abc),
                textController: productController.contactController,
              ),
              CustomTextField(
                labelText: "Address",
                prefixIcon: Icon(Icons.area_chart),
                textController: productController.addressController,
              ),
              CustomTextField(
                labelText: "City",
                prefixIcon: Icon(Icons.location_city),
                textController: productController.cityController,
              ),
              CustomTextField(
                labelText: "Pincode",
                prefixIcon: Icon(Icons.location_pin),
                textController: productController.pincodeController,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                        context: context,
                        initialDate: productController.dateTime,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                              hour: productController.dateTime.hour,
                              minute: productController.dateTime.minute));

                      if (time != null) {
                        final newDate = DateTime(date.year, date.month,
                            date.day, time.hour, time.minute);
                        debugPrint(newDate.toString());
                        productController.dateTime = newDate;
                        productController.update();
                      } else {
                        Fluttertoast.showToast(msg: "Haven't selected time!");
                      }
                    } else {
                      Fluttertoast.showToast(msg: "Haven't selected date!");
                    }
                  },
                  child: Text(
                    "Book your Slot!",
                    style: GoogleFonts.acme(),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //         onPressed: () async {
              //           final date = await showDatePicker(
              //               context: context,
              //               initialDate: productController.dateTime,
              //               firstDate: DateTime.now(),
              //               lastDate: DateTime(2100));

              //           productController.dateTime = date!;
              //           productController.update();
              //           debugPrint(productController.dateTime.toString());
              //         },
              //         child: Text(productController.dateTime.day.toString() +
              //             "/" +
              //             productController.dateTime.month.toString() +
              //             "/" +
              //             productController.dateTime.year.toString())),
              //     ElevatedButton(
              //         onPressed: () async {
              //           final time = await showTimePicker(
              //               context: context,
              //               initialTime: TimeOfDay(
              //                   hour: productController.dateTime.hour,
              //                   minute: productController.dateTime.minute));

              //           productController.update();
              //           debugPrint(productController.dateTime.toString());
              //         },
              //         child: Text(productController.dateTime.hour
              //                 .toString()
              //                 .padLeft(2, "0") +
              //             ":" +
              //             productController.dateTime.minute
              //                 .toString()
              //                 .padLeft(2, "0")))
              //   ],
              // ),

              GetBuilder<ProductController>(
                init: ProductController(),
                builder: (controller) {
                  return Text(
                    "Booked Sloted : " +
                        productController.dateTime.day
                            .toString()
                            .padLeft(2, "0") +
                        "/" +
                        productController.dateTime.month
                            .toString()
                            .padLeft(2, "0") +
                        "/" +
                        productController.dateTime.year.toString() +
                        "  " +
                        productController.dateTime.hour
                            .toString()
                            .padLeft(2, "0") +
                        ":" +
                        productController.dateTime.minute
                            .toString()
                            .padLeft(2, "0"),
                    style: GoogleFonts.acme(),
                  );
                },
              ),

              regularbtn("Book", () {})
            ],
          ),
        )),
      ),
    );
  }
}
