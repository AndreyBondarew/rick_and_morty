import '../person_list_model.dart';

class PersonListDto {
  final List<PersonListModel> persons;
  final int page;
  final int totalPages;
  final String? nextPageUrl;

  PersonListDto({
    required this.persons,
    required this.page,
    required this.totalPages,
    this.nextPageUrl,
  });
}
