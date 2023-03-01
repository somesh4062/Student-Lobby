import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_lobby/services/controller/servicesController.dart';

import '../../home/view/registeredServicesView.dart';

class ProductController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  ServicesController servicesController = Get.put(ServicesController());
  String dropDownValue = "Select Store";
  ServiceType selectedType = ServiceType.STATIONERY;
  var data = <String>["Select Store"].obs;
  var db = FirebaseFirestore.instance;
  RxString uploadImage = "".obs;

  @override
  void onInit() {
    super.onInit();
    getUserServices(ServiceType.STATIONERY);
  }

  getProductImage() async {
    final productImage =
        await ImagePicker.platform.getImage(source: ImageSource.gallery);

    if (productImage != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child("profileImages/" + productImage.name.toString());
      await ref.putFile(File(productImage.path));
      ref.getDownloadURL().then((value) {
        debugPrint(value);
        uploadImage.value = value;
        update();
      });
    }

    update();
  }

  getUserServices(ServiceType? serviceType) async {
    if (serviceType == ServiceType.SALON) {
      for (int i = 0; i < servicesController.userSalon.length; i++) {
        
        var tempData = await db
            .collection("salon")
            .doc(servicesController.userSalon[i])
            .get();
        debugPrint("Salon"+tempData["name"]);
        data.add(tempData["name"]);
      }
    } else {
      for (int i = 0; i < servicesController.userStationery.length; i++) {
        var tempData = await db
            .collection("stationery")
            .doc(servicesController.userStationery[i])
            .get();
        data.add(tempData["name"]);
      }
    }
    debugPrint("DATA" + data.toString());
    update();
  }

  setDropDownValue(String? newValue) {
    dropDownValue = newValue ?? "No value";
    update();
  }

  addProduct() async{
    
    if (dropDownValue.isEmpty || dropDownValue == "Select Store") {
      Fluttertoast.showToast(msg: "Please select a store");
    } else {
      QuerySnapshot stores = await FirebaseFirestore.instance.collection("salon").where("name",isEqualTo: dropDownValue.toString()).get();
      String storeId = stores.docs[0].id;
      Map<String, dynamic> dbData = {
        "name": nameController.text,
        "desc": descController.text,
        "price": priceController.text,
        "type": selectedType == ServiceType.STATIONERY ? "Stationery" : "Salon",
        "store": dropDownValue.toString(),
        "productImage": uploadImage.value,
        "user": FirebaseAuth.instance.currentUser?.uid,
        "storeId":storeId
      };
      db.collection("products").add(dbData).then((value) {
        Fluttertoast.showToast(msg: "ProductAdded");
        Get.back();
      });
    }
  }

  removeProduct(String id){
    FirebaseFirestore.instance.collection("products").doc(id).delete();
    Fluttertoast.showToast(msg: "Delete Successful");
    update();
  }

  placeOrder(String productId,String storeId, Map<String,dynamic> productData){
    Map<String, dynamic> dbData = {
        "name": nameController.text,
        "contact":contactController.text,
        "address":addressController.text,
        "city":cityController.text,
        "pincode":pincodeController.text,
        "storeId": storeId,
        "productId":productId,
        "userId": FirebaseAuth.instance.currentUser?.uid
      };
      dbData.addAll(productData);
      db.collection("orders").add(dbData).then((value) {
        Fluttertoast.showToast(msg: "Order Placed");
        Get.back();
      });
  }
}
