import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/widgets/widget.dart';

import '../controller/productController.dart';

class AddProductView extends StatelessWidget {
  AddProductView({Key? key}) : super(key: key);

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  productController.getProductImage();
                },
                child: Card(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(Icons.add_photo_alternate),
                  ),
                ),
              ),
            ),
            CustomTextField(
              textController: productController.nameController,
              labelText: "Name",
              prefixIcon: Icon(Icons.abc_rounded),
              type: false,
            ),
            CustomTextField(
              labelText: "Description",
              textController: productController.descController,
              prefixIcon: Icon(Icons.description),
              type: false,
            ),
            CustomTextField(
              labelText: "Price",
              textController: productController.priceController,
              prefixIcon: Icon(Icons.currency_rupee_sharp),
            ),
            // Autocomplete(optionsBuilder: optionsBuilder)
            regularbtn("Add ", () {})
          ],
        ),
      ),
    );
  }
}
