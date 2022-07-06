import '../../../../../common/base/query/base_query_handler.dart';
import '../../../../../common/model/episode_detail.dart';
import '../../get_episode.dart';

abstract class EpisodeDetailQueryHandlerContract implements BaseQueryHandler<GetEpisodeQuery, EpisodeDetailModel> {}
