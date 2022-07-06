import 'package:rik_and_morti_rest/app/core/common/base/query/base_exception.dart';
import 'package:rik_and_morti_rest/app/core/common/base/query/base_query.dart';
import 'package:rik_and_morti_rest/app/core/common/base/query/base_query_dispatcher.dart';
import 'package:rik_and_morti_rest/app/core/entities/location/query/get_location.dart';
import 'package:rik_and_morti_rest/app/core/entities/location/query/handler/contract/detail_contract.dart';
import 'package:rik_and_morti_rest/app/core/entities/location/query/handler/contract/list_contract.dart';

import '../fetch_list.dart';

class LocationQueryDispatcher implements BaseQueryDispatcher {
  LocationListQueryHandlerContract listHandler;
  LocationDetailQueryHandlerContract detailHandler;

  LocationQueryDispatcher({
    required this.listHandler,
    required this.detailHandler,
  });

  @override
  Future<dynamic> dispatch(BaseQuery query) async {
    if (query is LocationFetchListQuery) {
      return listHandler.execute(query);
    }
    if (query is GetLocationQuery) {
      return detailHandler.execute(query);
    }
    throw InvalidQueryException('query not found in dispatcher');
  }
}
