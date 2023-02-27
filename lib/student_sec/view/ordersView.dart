import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            isThreeLine: true,
            leading: CachedNetworkImage(
                imageUrl:
                    "https://cdn.pixabay.com/photo/2015/08/10/20/17/handbag-883122_1280.jpg"),
            title: Text("Product Name: LL Bag"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Desc: bag ahe re"), Text("Price: Rs. 100 ")],
            ),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ),
        );
      }),
    );
  }
}
