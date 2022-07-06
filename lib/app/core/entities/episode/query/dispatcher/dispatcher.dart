import 'package:rik_and_morti_rest/app/core/common/base/query/base_exception.dart';
import 'package:rik_and_morti_rest/app/core/common/base/query/base_query.dart';
import 'package:rik_and_morti_rest/app/core/common/base/query/base_query_dispatcher.dart';
import 'package:rik_and_morti_rest/app/core/entities/episode/query/get_episode.dart';

import '../fetch_list.dart';
import '../handler/contract/detail_contract.dart';
import '../handler/contract/list_contract.dart';

class EpisodeQueryDispatcher implements BaseQueryDispatcher {
  final EpisodeDetailQueryHandlerContract detailHandler;
  final EpisodeListQueryHandlerContract listHandler;

  EpisodeQueryDispatcher({
    required this.detailHandler,
    required this.listHandler,
  });

  @override
  Future<dynamic> dispatch(BaseQuery query) {
    if (query is EpisodeFetchListQuery) {
      return listHandler.execute(query);
    }
    if (query is GetEpisodeQuery) {
      return detailHandler.execute(query);
    }
    throw InvalidQueryException('query not found in dispatcher');
  }
}
