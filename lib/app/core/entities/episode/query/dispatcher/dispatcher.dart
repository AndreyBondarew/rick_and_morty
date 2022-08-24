import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/fetch_multiple_list.dart';

import '../../../../common/base/query/base_exception.dart';
import '../../../../common/base/query/base_query.dart';
import '../../../../common/base/query/base_query_dispatcher.dart';
import '../fetch_list.dart';
import '../get_episode.dart';
import '../handler/contract/detail_contract.dart';
import '../handler/contract/list_contract.dart';
import '../handler/contract/multiple_episode_list_contact.dart';

class EpisodeQueryDispatcher implements BaseQueryDispatcher {
  final EpisodeDetailQueryHandlerContract detailHandler;
  final EpisodeListQueryHandlerContract listHandler;
  final MultipleEpisodeListQueryHandlerContract filteredListHandler;

  EpisodeQueryDispatcher({required this.detailHandler, required this.listHandler, required this.filteredListHandler});

  @override
  Future<dynamic> dispatch(BaseQuery query) {
    if (query is EpisodeFetchListQuery) {
      return listHandler.execute(query);
    }
    if (query is GetEpisodeQuery) {
      return detailHandler.execute(query);
    }
    if (query is EpisodeFilteredFetchListQuery) {
      return filteredListHandler.execute(query);
    }
    throw InvalidQueryException('query not found in dispatcher');
  }
}
