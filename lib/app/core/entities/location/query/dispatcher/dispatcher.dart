import '../../../../common/base/query/base_exception.dart';
import '../../../../common/base/query/base_query.dart';
import '../../../../common/base/query/base_query_dispatcher.dart';
import '../fetch_list.dart';
import '../get_location.dart';
import '../handler/contract/detail_contract.dart';
import '../handler/contract/list_contract.dart';

class LocationQueryDispatcher implements BaseQueryDispatcher {
  LocationListQueryHandlerContract listHandler;
  LocationDetailQueryHandlerContract detailHandler;
  //LocationSingleListItemQueryHandler singleListItemHandler;

  LocationQueryDispatcher({
    required this.listHandler,
    required this.detailHandler,
    //required this.singleListItemHandler,
  });

  @override
  Future<dynamic> dispatch(BaseQuery query) async {
    if (query is LocationFetchListQuery) {
      return listHandler.execute(query);
    }
    if (query is GetLocationQuery) {
      return detailHandler.execute(query);
    }
    /*if (query is GetSingleItemLocationListQuery) {
      return singleListItemHandler.execute(query);
    }*/
    throw InvalidQueryException('query not found in dispatcher');
  }
}
