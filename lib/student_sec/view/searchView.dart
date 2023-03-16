import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/home/controller/searchViewController.dart';
import 'package:student_lobby/home/view/registeredServicesView.dart';
import 'package:student_lobby/product/view/productsListView.dart';
import 'package:student_lobby/product/view/serviceslistView.dart';

class SearchView extends StatelessWidget {
  //TextEditingController searchTxtController =TextEditingController();
  SearchViewController searchViewController = Get.put(SearchViewController());
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom:  TabBar(tabs: [
            Tab(
              child: Text(
                "Hostel",
                style: GoogleFonts.acme(color: Colors.black),
              ),
            ),
            Tab(
                child: Text(
              "Mess",
              style: GoogleFonts.acme(color: Colors.black),
            )),
            Tab(
                child: Text(
              "Salon",
              style: GoogleFonts.acme(color: Colors.black),
            )),
            Tab(
              text: "Stationary",
              // child: Text(
              //   "Stationary",
              //   style: GoogleFonts.acme(color: Colors.black),
              // ),
            )
          ]),
          actions: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              child: TextFormField(
                //controller: searchViewController.searchController,
                onChanged: (searchText) {
                  searchViewController.searchText.value = searchText;
                  searchViewController.update();
                  debugPrint("ST" + searchViewController.searchText.value);
                },
                decoration: InputDecoration(
                  suffixIconColor: Colors.black,
                  suffixIcon: InkWell(
                      onTap: () {
                        searchViewController.searchController.clear();
                        searchViewController.update();
                      },
                      child: Icon(Icons.close)),
                  hintText: "Search",
                  hintStyle: GoogleFonts.acme(color: Colors.black54)
                ),
              ),
            ))
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              ServicesListView(
                serviceType: ServiceType.HOSTEL,
              ),
              //productTab(),
              ServicesListView(
                serviceType: ServiceType.MESS,
              ),
              ProductsListView(
                serviceType: ServiceType.SALON,
              ),
              ProductsListView(
                serviceType: ServiceType.STATIONERY,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
