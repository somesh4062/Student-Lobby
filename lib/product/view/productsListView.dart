import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/home/view/registeredServicesView.dart';
import 'package:student_lobby/student_sec/view/stuproductslist.dart';

class ProductsListView extends StatelessWidget {
  ServiceType? serviceType=ServiceType.SALON;
  ProductsListView({Key? key,this.serviceType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String service = serviceType==ServiceType.SALON?"salon":"stationery";
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(service).snapshots(),
      
      builder: (context, snapshot) {
      if(snapshot.connectionState!=ConnectionState.active){
        return const Center(
        child: CircularProgressIndicator(),
        );
      }
     else{
      return ListView( 
        // shrinkWrap: true,
        children: snapshot.data!.docs.map((doc) {
        return Card(
        // elevation: 4,
        child: ListTile(
          isThreeLine: 
          true,
          leading: SizedBox(
            child: CachedNetworkImage(
                imageUrl: doc.data().toString().contains("uploadImage")?doc["uploadImage"]:
                    "https://cdn.pixabay.com/photo/2016/11/23/18/14/fountain-pen-1854169_1280.jpg",
                errorWidget:(context, url, error) =>  CachedNetworkImage(imageUrl: "https://cdn.pixabay.com/photo/2016/11/23/18/14/fountain-pen-1854169_1280.jpg"),        
            ),
          ),
          title: Text(doc["name"]),
          subtitle: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Area : "+doc["area"]), Text("City : "+doc["city"])],
          ),
          trailing: Container(
            height: Get.height * 0.05,
            width: Get.width * 0.25,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => StuProductList(docId: doc.id));
                },
                child: Text("Explore")),
          ),
        ),
      );
      }).toList()
      );
     }
    });
  }
}
