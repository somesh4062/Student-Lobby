import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/home/view/registeredServicesView.dart';
import 'package:student_lobby/widgets/widget.dart';

import '../controller/productController.dart';

class AddProductView extends StatelessWidget {
  AddProductView({Key? key}) : super(key: key);

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProductController>(
          init: ProductController(),
          builder: (controller) {
            return Column(
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
                        child: productController.uploadImage.value==""?Icon(Icons.add_photo_alternate):CachedNetworkImage(imageUrl: productController.uploadImage.value),
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
                Column(  
              children: <Widget>[  
                ListTile(  
                  title: const Text('SALON'),  
                  leading: Radio<ServiceType>(  
                    value: ServiceType.SALON,  
                    groupValue: productController.selectedType,  
                    onChanged: (ServiceType? value) {  
                       productController.data.clear();
                       productController.data.add("Select Store");
                       productController.getUserServices(value);
                       productController.selectedType=value??ServiceType.SALON;
                       productController.update();
                       
                    },  
                  ),  
                ),  
                ListTile(  
                  title: const Text('STATIONERY'),  
                  leading: Radio(  
                    value: ServiceType.STATIONERY,  
                    groupValue: productController.selectedType,  
                    onChanged: (ServiceType? value) {  
                      productController.data.clear();
                      productController.data.add("Select Store");
                      productController.getUserServices(value);
                      productController.selectedType=value??ServiceType.STATIONERY;
                      productController.update();
                    },  
                  ),  
                ), 
              ]), 

                DropdownButton(  
                  // Initial Value
                  value: productController.dropDownValue, 
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),    
                  // Array list of items
                  items: productController.data.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) => productController.setDropDownValue(newValue),
                ),
                // Autocomplete(optionsBuilder: optionsBuilder)
                regularbtn("Add ", () => productController.addProduct()),
        
                 
        
        
              ],
            );
          }
        ),
      ),
    );
  }
}
