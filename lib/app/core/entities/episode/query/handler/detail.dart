import 'package:rik_and_morti_rest/app/core/common/model/episode_detail.dart';
import 'package:rik_and_morti_rest/app/core/entities/episode/query/get_episode.dart';
import 'package:rik_and_morti_rest/app/core/entities/episode/query/handler/contract/detail_contract.dart';
import 'package:rik_and_morti_rest/app/core/entities/episode/repository/base_repository.dart';

class EpisodeDetailQueryHandler implements EpisodeDetailQueryHandlerContract {
  EpisodeBaseRepository repository;

  EpisodeDetailQueryHandler(this.repository);

  @override
  Future<EpisodeDetailModel> execute(GetEpisodeQuery query) {
    return repository.getEpisode(query.id);
  }
}
