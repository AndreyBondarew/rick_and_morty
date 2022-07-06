import '../../../../../common/base/query/base_query_handler.dart';
import '../../../../../common/model/episode_list.dart';
import '../../fetch_list.dart';

abstract class EpisodeListQueryHandlerContract implements BaseQueryHandler<EpisodeFetchListQuery, List<EpisodeListModel>> {}
