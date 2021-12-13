import 'package:get/get.dart';
import 'package:tracking/features/coordinate_management/coordinate_management_controller.dart';
import 'package:tracking/repositories/tracking_time_repository.dart';
import 'package:tracking/services/http_client.dart';

class AppBindings {

  AppBindings._();

  static  void initialize(){
    Get.lazyPut<HttpClient>(() => HttpClient());
    Get.lazyPut<TrackingTimeRepository>(() => TrackingTimeRepository(Get.find()));
    Get.lazyPut<CoordinateManagementController>(() => CoordinateManagementController(Get.find()));
  }


}