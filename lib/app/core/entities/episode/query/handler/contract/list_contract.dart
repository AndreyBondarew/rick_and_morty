import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/episode_list_dto.dart';

import '../../../../../common/base/query/base_query_handler.dart';
import '../../fetch_list.dart';

abstract class EpisodeListQueryHandlerContract implements BaseQueryHandler<EpisodeFetchListQuery, EpisodeListDto> {}
