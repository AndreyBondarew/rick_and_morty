import 'package:rik_and_morti_rest/app/core/common/base/query/base_query_handler.dart';
import 'package:rik_and_morti_rest/app/core/common/model/episode_detail.dart';
import 'package:rik_and_morti_rest/app/core/entities/episode/query/get_episode.dart';

abstract class EpisodeDetailQueryHandlerContract implements BaseQueryHandler<GetEpisodeQuery, EpisodeDetailModel> {}
