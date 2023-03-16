import 'package:get/get.dart';
import 'package:student_lobby/home/view/dashboard.dart';
import 'package:student_lobby/home/view/dashboardbinding.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.DASHBOARD,
        page: (() => Dashboard()),
        binding: DashboardBinding())
  ];
}
