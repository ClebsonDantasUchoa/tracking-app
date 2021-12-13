import 'package:tracking/auto_export.dart';

abstract class Failure {

  final String message;

  Failure(this.message);
}

class ConnectionTimeOut extends Failure {
  ConnectionTimeOut() : super(AppStrings.connectionTimeOut);
}

class ServerDidNotRespondAsExpected extends Failure {
  ServerDidNotRespondAsExpected() : super(AppStrings.serverDidNotRespondAsExpected);
}

class UnknownErrorCommunicatingWithServer extends Failure {
  UnknownErrorCommunicatingWithServer() : super(AppStrings.unknownErrorCommunicatingWithServer);
}