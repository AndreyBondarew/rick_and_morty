import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';

import '../../../../core/common/model/dto/person_list_dto.dart';
import '../../../../core/common/model/person_list_model.dart';
import '../../../../core/entities/person/repository/base_repository.dart';
import '../constant.dart';
import '../exception.dart';

class PersonListRestRepository implements PersonListBaseRepository {
  final String _baseUrl = '$baseApiUrl$characterEndpoint';

  @override
  Future<PersonListDto> fetchList(int page) async {
    //print('load pages: $page');
    http.Response response = await http.get(Uri.parse('$_baseUrl/?page=$page'));
    if (response.statusCode == 200) {
      final List<PersonListModel> personsList = [];
      final dynamic jsonData = jsonDecode(response.body);
      final List<dynamic> jsonResult = jsonData['results'];
      for (var element in jsonResult) {
        personsList.add(PersonListModel.fromMap(element));
      }
      return PersonListDto(persons: personsList, page: page, totalPages: jsonData['info']['pages']);
    }
    throw RestApiRepositoryException(
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase,
      endPoint: '$_baseUrl/?page=$page',
    );
  }

  @override
  Future<PersonListDto> fetchMultipleListPerson(BaseFilter filter) async {
    var response = await http.get(Uri.parse('$_baseUrl/${filter.filter}'));
    if (response.statusCode == 200) {
      final List<PersonListModel> persons = [];
      jsonDecode(response.body).forEach((element) {
        persons.add(PersonListModel.fromMap(element));
      });
      return PersonListDto(persons: persons, page: 1, totalPages: 1);
    }
    throw RestApiRepositoryException(
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase,
      endPoint: '$_baseUrl/$filter',
    );
  }

  /*@override
  Future<PersonListDto> fetchList({int? page, BaseFilter? filter}) {
    assert((page != null && filter == null) || (page == null && filter != null));
    if (page != null) {
      return _fetchPersons(page);
    }
    return (_fetchPersonsByFilter(filter!));
  }*/
}
