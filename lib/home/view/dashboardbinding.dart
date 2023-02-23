import 'package:get/get.dart';
import 'package:student_lobby/home/controller/dashboardController.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}

