import '../../../common/base/query/base_query.dart';

class PersonsFetchListQuery implements BaseQuery {
  final int page;

  PersonsFetchListQuery(this.page);
}
