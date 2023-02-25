import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:student_lobby/widgets/widget.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          leading: CachedNetworkImage(imageUrl: ""),
          title: const Text("Product Name"),
          subtitle: const Text("Description "),
          trailing: ElevatedButton(onPressed: () {}, child: Text("Buy")),
        ),
      );
    });
  }
}
