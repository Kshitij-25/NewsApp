abstract class Failure {
  String get message;
}

class ServerFailure extends Failure {
  final String serverFailureMessage;

  ServerFailure({required this.serverFailureMessage});
  @override
  String get message => 'Server Failure: $serverFailureMessage';
}

class NetworkFailure extends Failure {
  final String networkFailureMessage;

  NetworkFailure({required this.networkFailureMessage});
  @override
  String get message => 'Network Failure: $networkFailureMessage';
}
