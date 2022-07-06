import 'package:rik_and_morti_rest/app/core/common/base/query/base_query.dart';

class LocationFetchListQuery implements BaseQuery {
  final int? page;

  LocationFetchListQuery([this.page]);
}
