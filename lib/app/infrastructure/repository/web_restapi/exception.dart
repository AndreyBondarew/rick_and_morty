import '../base_repository_exception.dart';

class BaseRestRepositoryException implements BaseRepositoryException {
  @override
  final String? message;

  BaseRestRepositoryException([this.message]);
}

class RestApiRepositoryException implements BaseRepositoryException {
  @override
  final String? message;

  final int statusCode;
  final String? reasonPhrase;
  final String? endPoint;

  RestApiRepositoryException({required this.statusCode, this.reasonPhrase, this.endPoint})
      : message = 'status code: $statusCode, reason: $reasonPhrase, endpoint: $endPoint';

  @override
  String toString() => '$runtimeType: Error - $message';
}

class RestApiEmptyDataException implements BaseRestRepositoryException {
  @override
  final String? message;

  RestApiEmptyDataException([this.message]);
}
