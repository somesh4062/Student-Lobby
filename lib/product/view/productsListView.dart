import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/student_sec/view/stuproductslist.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
        elevation: 4,
        child: ListTile(
          isThreeLine: 
          true,
          leading: CachedNetworkImage(
              imageUrl:
                  "https://cdn.pixabay.com/photo/2016/11/23/18/14/fountain-pen-1854169_1280.jpg"),
          title: const Text("Stationery Name"),
          subtitle: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Area : Narhe  "), Text("City : Pune ")],
          ),
          trailing: ElevatedButton(
              onPressed: () {
                Get.to(() => const StuProductList());
              },
              child: Text("Explore")),
        ),
      );
    });
  }
}
