import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/product/view/salonOrderView.dart';
import 'package:student_lobby/product/view/statOrderView.dart';

class StuProductList extends StatelessWidget {
  String docId;
  StuProductList({Key? key, required this.docId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("DocID" + docId);
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
        body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("products")
                .where("storeId", isEqualTo: docId)
                .snapshots(),
            builder: ((context, snapshot) {
              //debugPrint("Doc Id"+snapshot.data!.docs.toString());
              if (snapshot.connectionState != ConnectionState.active) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView(
                    children: snapshot.data!.docs.map((doc) {
                  //debugPrint("Called THis"+doc.toString());
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Card(
                        elevation: 4,
                        child: ListTile(
                          isThreeLine: true,
                          leading: CachedNetworkImage(
                              imageUrl: doc["productImage"] ??
                                  "https://cdn.pixabay.com/photo/2019/07/14/16/29/pen-4337524_1280.jpg"),
                          title: Text("Product Name: " + doc["name"]),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Description: " + doc["desc"]),
                              Text("Price: Rs. " + doc["price"])
                            ],
                          ),
                          trailing: ElevatedButton(
                              onPressed: () {
                                Map<String, dynamic> productData = {
                                  "description": doc["desc"],
                                  "productName": doc["name"],
                                  "price": doc["price"],
                                  "productImage": doc["productImage"]
                                };
                                if(doc["type"]=="Stationery"){
                                Get.to(() => StatOrderView(
                                    storeId: docId,
                                    productId: doc.id,
                                    productData: productData,productType: doc["type"]));
                                }else{
                                  Get.to(() => SalonOrderView(
                                    storeId: docId,
                                    productId: doc.id,
                                    productData: productData,productType: doc["type"]));
                                }
                              },
                              child: Text("Buy")),
                        )),
                  );
                }).toList());
              }
            }),
          ),
        ));
  }
}
