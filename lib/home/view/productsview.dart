import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/product/controller/productController.dart';
import 'package:student_lobby/product/view/addProductView.dart';
import 'package:student_lobby/widgets/widget.dart';

class ProductsView extends GetView {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProductController>(
          init: ProductController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 10, )),
                  regularbtn(" + Add Product", () {
                    Get.to(()=>AddProductView());
                  }),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection("products").where("user",isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState!=ConnectionState.active){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else{
                      debugPrint("Current User"+FirebaseAuth.instance.currentUser!.uid);
                      return ListView(
                         shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: snapshot.data!.docs.map((doc) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
                            child: Card(
                              elevation: 5,
                              child: ListTile(
                                
                                leading: CachedNetworkImage(imageUrl: doc["productImage"], width: Get.width*0.20,height: Get.height*0.15,fit: BoxFit.cover,),
                                title: Text(doc["name"]),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
        
                                    Text("Description: "+doc["desc"]),
                                    Text("Price: "+doc["price"])
                                  ],
                                ),
                              trailing: InkWell(
                                onTap: (){
                                  controller.removeProduct(doc.id);
                                },
                                child: Icon(Icons.delete),
                              ),
                            ),
                          ));
                        }).toList(),
                      );
                    
                    }
                  })
                ],
              )),
            );
          }
        ),
      ),
    );
  }
}
