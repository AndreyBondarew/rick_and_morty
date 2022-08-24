import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/episode_list_dto.dart';

import '../../../common/base/base_repository.dart';
import '../../../common/model/episode_detail.dart';

abstract class EpisodeDetailBaseRepository implements BaseRepository {
  Future<EpisodeDetailModel> getEpisode(int id);
}

abstract class EpisodeListBaseRepository implements BaseRepository {
  Future<EpisodeListDto> fetchList(int page);

  Future<EpisodeListDto> fetchMultipleFilteredEpisode(BaseFilter filter);
}
