import 'package:rik_and_morti_rest/app/core/common/base/query/base_query_handler.dart';
import 'package:rik_and_morti_rest/app/core/entities/episode/query/fetch_list.dart';

import '../../../../../common/model/episode_list.dart';

abstract class EpisodeListQueryHandlerContract implements BaseQueryHandler<EpisodeFetchListQuery, List<EpisodeListModel>> {}
