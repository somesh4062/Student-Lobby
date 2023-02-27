import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/product/view/confirmOrderView.dart';

class StuProductList extends StatelessWidget {
  const StuProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back,color: Colors.black,)),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Card(
                    elevation: 4,
                    child: ListTile(
                      isThreeLine: true,
                      leading: CachedNetworkImage(
                          imageUrl:
                              "https://cdn.pixabay.com/photo/2019/07/14/16/29/pen-4337524_1280.jpg"),
                      title: Text("Product Name: XYZ"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description: Pen"),
                          Text("Price: Rs. 10")
                        ],
                      ),
                      trailing: ElevatedButton(
                          onPressed: () {
                            Get.to(() =>ConfirmOrderView());
                          },
                          child: Text("Buy")),
                    )),
              );
            }),
          ),
        ));
  }
}
