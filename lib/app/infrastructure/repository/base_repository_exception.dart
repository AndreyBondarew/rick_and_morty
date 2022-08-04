import 'package:rick_and_morty_test_restapi/app/core/common/base/exception.dart';

class BaseRepositoryException implements BaseAppException {
  @override
  final String? message;

  BaseRepositoryException([this.message]);
}
