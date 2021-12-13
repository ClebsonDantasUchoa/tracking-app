import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auto_export.dart';
import 'package:tracking/features/coordinate_management/coordinate_management_page.dart';

void main() {

  AppBindings.initialize();

  runApp(
    GetMaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoutes.pages,
      home: CoordinateManagementPage(Get.find()),
    )
  );
}
