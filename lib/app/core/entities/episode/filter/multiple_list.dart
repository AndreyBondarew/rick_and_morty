import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';

class MultipleEpisodeFilter implements BaseFilter<List<String>> {
  @override
  final String? filterName;

  @override
  final String? filterCriteria;

  @override
  final List<String> filter;
  MultipleEpisodeFilter({
    required this.filter,
    this.filterName,
    this.filterCriteria,
  });
}
