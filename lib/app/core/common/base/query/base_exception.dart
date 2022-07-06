class BaseQueryException implements Exception {}

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
