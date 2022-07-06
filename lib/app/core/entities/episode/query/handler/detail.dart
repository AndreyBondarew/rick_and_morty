import '../../../../common/model/episode_detail.dart';
import '../../repository/base_repository.dart';
import '../get_episode.dart';
import 'contract/detail_contract.dart';

class EpisodeDetailQueryHandler implements EpisodeDetailQueryHandlerContract {
  EpisodeBaseRepository repository;

  EpisodeDetailQueryHandler(this.repository);

  @override
  Future<EpisodeDetailModel> execute(GetEpisodeQuery query) {
    return repository.getEpisode(query.id);
  }
}
