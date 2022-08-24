import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/base/query/base_query.dart';

class EpisodeFilteredFetchListQuery extends BaseQuery {
  final BaseFilter filter;

  EpisodeFilteredFetchListQuery(this.filter);
}
