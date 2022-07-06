import 'package:rik_and_morti_rest/app/core/entities/episode/query/fetch_list.dart';
import 'package:rik_and_morti_rest/app/core/entities/episode/query/handler/contract/list_contract.dart';
import 'package:rik_and_morti_rest/app/core/entities/episode/repository/base_repository.dart';

import '../../../../common/model/episode_list.dart';

class EpisodeListQueryHandler implements EpisodeListQueryHandlerContract {
  EpisodeBaseRepository repository;

  EpisodeListQueryHandler(this.repository);

  @override
  Future<List<EpisodeListModel>> execute(EpisodeFetchListQuery query) async {
    return repository.fetchList(query.page);
  }
}
