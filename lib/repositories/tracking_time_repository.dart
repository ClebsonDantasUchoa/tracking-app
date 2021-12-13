import 'package:dartz/dartz.dart';
import 'package:tracking/mixins/handle_failure.dart';
import 'package:tracking/resources/failures.dart';
import 'package:tracking/services/http_client.dart';
import 'package:tracking/models/tracking_time.dart';
import 'dart:convert';

class TrackingTimeRepository with HandleFailure {

  HttpClient _httpClient;
  final String _path = "tracking-time";

  TrackingTimeRepository(this._httpClient);

  Future<Either<Failure, bool>> update(TrackingTime trackingTime) async {
    try {
      final response = await _httpClient.putRequest(_path, json.encode(trackingTime.toMap()));
      final hasError = _hasError(response.statusCode);
      if(hasError) return Left(handleHttpError(response.statusCode));
      return Right(true);
    }catch(_) {
      return Left(UnknownErrorCommunicatingWithServer());
    }
  }

  bool _hasError(int statusCode) => HttpClient.successCodes.contains(statusCode) == false;
  
}