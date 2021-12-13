class ServiceUnavailable implements Exception {}

class NoInternetConnection implements Exception {}

class UnknownError implements Exception {
  final String? errorMessage;
  final StackTrace? stackTrace;

  UnknownError({this.errorMessage, this.stackTrace});
}

class TimeoutError implements Exception {}
