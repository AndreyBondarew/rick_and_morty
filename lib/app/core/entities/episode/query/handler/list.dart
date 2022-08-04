import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/episode_list_dto.dart';

import '../../repository/base_repository.dart';
import '../fetch_list.dart';
import 'contract/list_contract.dart';

class EpisodeListQueryHandler implements EpisodeListQueryHandlerContract {
  EpisodeListBaseRepository repository;

  EpisodeListQueryHandler(this.repository);

  @override
  Future<EpisodeListDto> execute(EpisodeFetchListQuery query) async {
    return repository.fetchList(query.page);
  }
}
