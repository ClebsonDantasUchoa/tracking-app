import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/models/tracking_time.dart';
import 'package:tracking/repositories/tracking_time_repository.dart';
import 'package:tracking/resources/failures.dart';

class CoordinateManagementController extends GetxController {

  Rx<TimeOfDay> coordinatesCollectionTime;
  Rx<TimeOfDay> timeForSendingCoordinatesToServer;
  TrackingTimeRepository _trackingTimeRepository;

  CoordinateManagementController(this._trackingTimeRepository) {
    final now = DateTime.now();
    coordinatesCollectionTime = TimeOfDay(hour: now.hour, minute: now.minute).obs;
    timeForSendingCoordinatesToServer = TimeOfDay(hour: now.hour, minute: now.minute).obs;
  }

  Future<Either<Failure, bool>> saveTrackingTimes() async {
    //Simulando uma demora no serviço
    await Future.delayed(Duration(seconds: 3));
    final trackingTime = TrackingTime(coordinatesCollectionTime.value, timeForSendingCoordinatesToServer.value);
    final result = await _trackingTimeRepository.update(trackingTime);
    //Simualando que retornou com sucesso
    return Right(true);
    //return result;
  }
  
}