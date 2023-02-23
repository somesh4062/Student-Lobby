
import 'package:get/get.dart';
import 'package:student_lobby/student_sec/controller/studentDashboardController.dart';

class StudentDashboardBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<StudentDashboardController>(() => StudentDashboardController());
  }

}