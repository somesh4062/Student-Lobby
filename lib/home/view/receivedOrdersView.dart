import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/services/controller/servicesController.dart';

class ReceivedOrdersView extends StatelessWidget {
  ReceivedOrdersView({Key? key}) :super(key: key);
  ServicesController servicesController =Get.put(ServicesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<QueryDocumentSnapshot>>(
        future: servicesController.getOrders(),
        builder: (context,snapshot) {
        if(snapshot.connectionState!=ConnectionState.active){
            return const Center(
            child: CircularProgressIndicator(),
            );
          }
          else{
            return ListView(
              children: snapshot.data!.map((doc) {
                return Card(
              elevation: 4,
              child: ListTile(
                isThreeLine: true,
                leading: CachedNetworkImage(
                    imageUrl: doc["productImage"]??
                        "https://cdn.pixabay.com/photo/2015/08/10/20/17/handbag-883122_1280.jpg"),
                title: Text("Product Name: "+doc["productName"] ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Desc: "+doc["description"]), Text("Price: "+doc["price"])],
                ),
                //trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ),
            );
              }).toList(),
            );
            
                    }
      }),
    );
  }
  }
