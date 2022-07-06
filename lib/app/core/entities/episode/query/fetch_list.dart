import 'package:rik_and_morti_rest/app/core/common/base/query/base_query.dart';

class EpisodeFetchListQuery extends BaseQuery {
  final int? page;

  EpisodeFetchListQuery([this.page]);
}
