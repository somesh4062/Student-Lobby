import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/product/controller/productController.dart';
import 'package:student_lobby/widgets/widget.dart';

class StatOrderView extends StatelessWidget {
  String storeId;
  String productId;
  Map<String, dynamic> productData;
  String productType;
  StatOrderView({
    Key? key,
    required this.storeId,
    required this.productId,
    required this.productData,
    required this.productType,
  }) : super(key: key);

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    debugPrint(productData.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirm Order",
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
          ),
        ),
      ),
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    isThreeLine: true,
                    leading: CachedNetworkImage(imageUrl: ""),
                  ),
                ),
              ),
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
                productController.placeOrder(
                    productId, storeId, productData, productType);
              })
            ],
          ),
        )),
      ),
    );
  }
}
