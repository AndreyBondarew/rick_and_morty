import '../../../../common/base/query/base_exception.dart';
import '../../../../common/base/query/base_query.dart';
import '../../../../common/base/query/base_query_dispatcher.dart';
import '../fetch_list.dart';
import '../fetch_multiple_list.dart';
import '../get_person.dart';
import '../handler/contract/detail_contract.dart';
import '../handler/contract/list_contract.dart';
import '../handler/contract/multiple_person_list_contract.dart';

class PersonQueryDispatcher extends BaseQueryDispatcher {
  final PersonDetailQueryHandlerContract detailHandler;
  final PersonListQueryHandlerContract listHandler;
  final MultiplePersonFetchListQueryHandlerContract filteredListHandler;

  PersonQueryDispatcher({
    required this.detailHandler,
    required this.listHandler,
    required this.filteredListHandler,
  });

  @override
  Future<dynamic> dispatch(BaseQuery query) async {
    if (query is PersonsFetchListQuery) {
      return listHandler.execute(query);
    }
    if (query is GetPersonFromId) {
      return detailHandler.execute(query);
    }
    if (query is PersonsFilteredFetchListQuery) {
      return filteredListHandler.execute(query);
    }
    throw InvalidQueryException('not found query in dispatcher!');
  }
}
