import 'package:get/get.dart';

import 'package:student_lobby/student_sec/view/studentDashboard.dart';
import 'package:student_lobby/student_sec/view/studentDashboardBinding.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(name: AppRoutes.STUDENTDASHBOARD, page: (() => StudentDashboard()),binding: StudentDashboardBinding())
  ];
}
