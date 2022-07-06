import '../../../../common/model/episode_list.dart';
import '../../repository/base_repository.dart';
import '../fetch_list.dart';
import 'contract/list_contract.dart';

class EpisodeListQueryHandler implements EpisodeListQueryHandlerContract {
  EpisodeBaseRepository repository;

  EpisodeListQueryHandler(this.repository);

  @override
  Future<List<EpisodeListModel>> execute(EpisodeFetchListQuery query) async {
    return repository.fetchList(query.page);
  }
}
