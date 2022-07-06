import '../person_list_model.dart';

class PersonListDto {
  final List<PersonListModel> persons;
  int page;
  int totalPages;
  String? nextPageUrl;

  PersonListDto({
    required this.persons,
    required this.page,
    required this.totalPages,
    this.nextPageUrl,
  });
}
