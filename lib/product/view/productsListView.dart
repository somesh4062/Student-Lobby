import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return  const Card(
        child:  ListTile(
          
        ),
      );
    });
  }
}
