import 'package:get/get.dart';
import 'package:tracking/features/coordinate_management/coordinate_management_page.dart';

class AppRoutes {

  AppRoutes._();

  static const home = "/";
  
  static final pages = [
    GetPage(
      name: home,
      page: () => CoordinateManagementPage(Get.find()),
    )
  ];

}