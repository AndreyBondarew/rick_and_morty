import 'package:rik_and_morti_rest/app/core/common/base/query/base_query.dart';

class PersonsFetchListQuery implements BaseQuery {
  final int page;

  PersonsFetchListQuery(this.page);
}
