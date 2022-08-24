import 'package:rick_and_morty_test_restapi/app/core/common/base/query/base_query_handler.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/episode_list_dto.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/fetch_multiple_list.dart';

abstract class MultipleEpisodeListQueryHandlerContract extends BaseQueryHandler<EpisodeFilteredFetchListQuery, EpisodeListDto> {}
