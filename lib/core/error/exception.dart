class ServerException implements Exception {
  final int statusCode;
  final String message;

  ServerException({this.statusCode, this.message});
}

class CacheException implements Exception {}

class UserNotCachedException implements Exception {}

class GenericException implements Exception {}
