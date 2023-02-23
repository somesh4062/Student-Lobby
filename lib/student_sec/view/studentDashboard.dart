import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/home/view/searchView.dart';
import 'package:student_lobby/student_sec/controller/studentDashboardController.dart';
import 'package:student_lobby/student_sec/view/ordersView.dart';
import 'package:student_lobby/user/view/profileview.dart';

class StudentDashboard extends StatelessWidget {
  StudentDashboard({Key? key}) : super(key: key);

  StudentDashboardController controller = Get.put(StudentDashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentDashboardController>(builder: ((controller) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: const CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  "https://images.pexels.com/photos/1855582/pexels-photo-1855582.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Student Lobby",
            style: GoogleFonts.montserrat(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.logout),
                color: Colors.black,
              ),
            )
          ],
        ),
        body: SafeArea(
            child: IndexedStack(
          index: controller.tabIndex,
          children: [SearchView(), OrdersView(), ProfileView()],
        )),
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.search, label: "Search"),
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.cart, label: "Cart"),
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.person, label: "Account")
            ]),
      );
    }));
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
