import 'package:flutter/material.dart';
import 'package:tracking/extensions/time_of_day_extension.dart';

class TrackingTime {

  TimeOfDay coordinatesCollectionTime;
  TimeOfDay timeForSendingCoordinatesToServer;

  TrackingTime(this.coordinatesCollectionTime, this.timeForSendingCoordinatesToServer);

  Map<String, dynamic> toMap() {
    return {
      "coordinatesCollectionTime": coordinatesCollectionTime.formartToHourAndMinute,
      "timeForSendingCoordinatesToServer": timeForSendingCoordinatesToServer.formartToHourAndMinute
    };
  }
  

}