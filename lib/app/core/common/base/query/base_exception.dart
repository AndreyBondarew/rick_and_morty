import '../exception.dart';

class BaseQueryException implements BaseAppException {
  @override
  final String? message;

  BaseQueryException([this.message]);
}

class InvalidQueryException implements BaseQueryException {
  final String? message;
  final String _baseMessage = 'InvalidQueryException';

  InvalidQueryException([this.message]);

  @override
  String toString() {
    if (message == null) {
      return _baseMessage;
    }
    return '$_baseMessage: ${message ?? ''}';
  }
}
