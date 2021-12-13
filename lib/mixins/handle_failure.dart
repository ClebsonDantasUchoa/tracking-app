import 'package:tracking/resources/failures.dart';
import 'package:tracking/services/http_client.dart';

mixin HandleFailure {

  Failure handleHttpError(int statusCode) {
    //TODO Map other http errors
    if(HttpClient.successCodes.contains(statusCode)) return null;
    return statusCode == 408 || statusCode == 504 ? ConnectionTimeOut() : ServerDidNotRespondAsExpected();
  }

}