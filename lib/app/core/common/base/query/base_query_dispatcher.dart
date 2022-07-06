import 'base_query.dart';

abstract class BaseQueryDispatcher {
  Future<dynamic> dispatch(BaseQuery query);
}
