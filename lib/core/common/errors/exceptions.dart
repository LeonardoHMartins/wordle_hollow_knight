class ServerException implements Exception {
  final String? message;
  final StackTrace? stackTrace;
  ServerException({this.message, this.stackTrace});
}

class DBException implements Exception {
  final String? message;
  DBException({this.message});
}

class NotFoundException implements Exception {
  final String? message;
  NotFoundException({this.message});
}
