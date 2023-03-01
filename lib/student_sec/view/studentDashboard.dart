import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/student_sec/view/searchView.dart';
import 'package:student_lobby/login_reg/controller/loginController.dart';
import 'package:student_lobby/student_sec/controller/studentDashboardController.dart';
import 'package:student_lobby/student_sec/view/ordersView.dart';
import 'package:student_lobby/user/view/profileview.dart';

class StudentDashboard extends StatelessWidget {
  StudentDashboard({Key? key}) : super(key: key);

  StudentDashboardController controller = Get.put(StudentDashboardController());
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentDashboardController>(builder: ((controller) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: const CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
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
                onPressed: () {
                  loginController.signOut();
                },
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
