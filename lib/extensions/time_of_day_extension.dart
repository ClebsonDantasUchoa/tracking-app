import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {

  String get formartToHourAndMinute =>
    this.toString().replaceAll("TimeOfDay", "").replaceAll("(", "").replaceAll(")", "").replaceAll(":", " : ");
    
}