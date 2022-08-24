import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/episode_list_dto.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/fetch_multiple_list.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/handler/contract/multiple_episode_list_contact.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/repository/base_repository.dart';

class MultipleEpisodeListQueryHandler extends MultipleEpisodeListQueryHandlerContract {
  final EpisodeListBaseRepository repository;

  MultipleEpisodeListQueryHandler(this.repository);

  @override
  Future<EpisodeListDto> execute(EpisodeFilteredFetchListQuery query) {
    return repository.fetchMultipleFilteredEpisode(query.filter);
  }
}
