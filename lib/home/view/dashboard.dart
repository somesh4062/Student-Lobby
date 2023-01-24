import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/home/controller/dashboardController.dart';
import 'package:student_lobby/home/view/homepage.dart';
import 'package:student_lobby/home/view/productsview.dart';
import 'package:student_lobby/home/view/profileview.dart';
import 'package:student_lobby/home/view/serviceview.dart';
import 'package:student_lobby/widgets/widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: ((controller) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Student Lobby",
              style: GoogleFonts.montserrat(color: Colors.black),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    onPressed: () {
                     loginController.signOut();
                    },
                    icon: const Icon(Icons.logout),
                    color: Colors.black,
                  ))
            ],
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                ProductsView(),
                ServicesView(),
                ProfileView(),
              ],
            ),
          ),
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
                    icon: CupertinoIcons.home, label: "Home"),
                _bottomNavigationBarItem(
                    icon: CupertinoIcons.shopping_cart, label: "Products"),
                _bottomNavigationBarItem(
                    icon: CupertinoIcons.collections, label: "Services"),
                _bottomNavigationBarItem(
                    icon: CupertinoIcons.person, label: "Account")
              ])

          //  BottomNavigationBar(
          //   items: const [
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.home,
          //         color: Colors.black,
          //       ),
          //       label: "Home",
          //     ),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.shopping_bag, color: Colors.black),
          //         label: "Products"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.category, color: Colors.black),
          //         label: null),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.person, color: Colors.black), label: "Profile"),
          //   ],
          // ),
          );
    }));
  }

  _bottomNavigationBarItem({IconData icon, String label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
