import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/product/controller/productController.dart';
import 'package:student_lobby/widgets/widget.dart';

class StatOrderView extends StatelessWidget {
  String storeId;
  String productId;
  Map<String, dynamic> productData;
  StatOrderView(
      {Key? key,
      required this.storeId,
      required this.productId,
      required this.productData})
      : super(key: key);

  ProductController productController = Get.put(ProductController());

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
          ),
        ),
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
              regularbtn("Place Order", () {
                productController.placeOrder(productId, storeId, productData);
              })
            ],
          ),
        )),
      ),
    );
  }
}
