class BaseFilter<T> {
  final String? filterName;
  final String? filterCriteria;
  final T filter;

  BaseFilter({this.filterName, this.filterCriteria, required this.filter});
}
