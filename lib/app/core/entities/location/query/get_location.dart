import 'package:rik_and_morti_rest/app/core/common/base/query/base_query.dart';

class GetLocationQuery implements BaseQuery {
  final int locationId;

  GetLocationQuery(this.locationId);
}