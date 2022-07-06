import 'package:rik_and_morti_rest/app/core/common/base/base_repository.dart';

import '../../../common/model/episode_detail.dart';
import '../../../common/model/episode_list.dart';

abstract class EpisodeBaseRepository implements BaseRepository {
  Future<List<EpisodeListModel>> fetchList([int? page]);

  Future<EpisodeDetailModel> getEpisode(int id);
}
