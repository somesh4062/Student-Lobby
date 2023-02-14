import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/widgets/widget.dart';

class ProductsView extends GetView {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 10, )),
              regularbtn(" + Add Product", () {}),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 2,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      
                      leading: SizedBox(
                      //  height: 10,
                      //  width: 20,
                        child: Image.network("http://www.thewowstyle.com/wp-content/uploads/2015/01/nature-images.jpg")),
                    ),
                  ),
                );
              })
            ],
          )),
        ),
      ),
    );
  }
}
