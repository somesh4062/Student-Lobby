import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_lobby/home/controller/dashboardController.dart';
import 'package:student_lobby/home/routes/app_pages.dart';
import 'package:student_lobby/home/routes/app_routes.dart';
import 'package:student_lobby/home/view/dashboard.dart';
import 'package:student_lobby/home/view/registeredServicesView.dart';
import 'package:student_lobby/student_sec/view/searchView.dart';
import 'package:student_lobby/login_reg/controller/loginController.dart';
import 'package:student_lobby/login_reg/view/login.dart';
import 'package:student_lobby/student_sec/view/studentDashboard.dart';

import 'student_sec/controller/studentDashboardController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
 
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());
  DashboardController dashboardController = Get.put(DashboardController());
    StudentDashboardController controller = Get.put(StudentDashboardController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      // getPages: AppPages.list,
      // initialRoute: AppRoutes.DASHBOARD,
      debugShowCheckedModeBanner: false,
      home: 
      // SearchView()
     // RegServicesView()
    //  AddProductView()
      
      StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var isStudent=true;
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data == null) {
                  
                  return Login();
                  
                } else {
                  return FutureBuilder<bool>(
                    future: loginController.isUserStudent(),
                    initialData: null,
                    builder: ((context, snapshot) {
                    if(snapshot.data==true) {
                      return StudentDashboard();
                    } else {
                      return Dashboard();
                    }
                  }));               
                }
              }
  
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ));
        }  
}
