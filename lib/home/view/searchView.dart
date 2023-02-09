import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/product/view/productlistView.dart';
import 'package:student_lobby/widgets/widget.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
          ),
          bottom: const TabBar(tabs: [
            Tab(child: Text("Hostel",style: TextStyle(color: Colors.black),),),
            Tab(child: Text("Mess",style: TextStyle(color: Colors.black),)),
            Tab(child: Text("Salon",style: TextStyle(color: Colors.black),)),
            Tab(child: Text("Stationary",style: TextStyle(color: Colors.black),),)
          ]),
          actions: <Widget>[
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.only(left: 60, right: 30, top: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIconColor: Colors.black,
                  suffixIcon: Icon(Icons.close),
                  hintText: "Search",),
              ),
            ))
          ],
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                
                children: [
                  ProductListView(),
                  //productTab(),
                  Text("MEss"),
                  Text("Hostel"),
                  Text("MEss")
                ],
              ),
            )),
      ),
    );
  }
}
