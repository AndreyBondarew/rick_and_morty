import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/common/model/dto/person_list_dto.dart';
import '../../../core/common/model/person_detail_model.dart';
import '../../../core/common/model/person_list_model.dart';
import '../../../core/entities/person/repository/base_repository.dart';
import 'constant.dart';

class PersonRestRepository implements PersonBaseRepository {
  final String _baseUrl = '$baseApiUrl$characterEndpoint/?page=';

  @override
  Future<PersonListDto> fetchPersons(int page) async {
    print('load page: $page');
    var response = await http.get(Uri.parse(_baseUrl + page.toString()));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<PersonListModel> personsList = [];
      List<dynamic> jsonResult = jsonResponse['results'];
      for (var element in jsonResult) {
        personsList.add(PersonListModel.fromMap(element));
      }
      return PersonListDto(persons: personsList, page: page, totalPages: jsonResponse['info']['pages']);
    }

    //PersonListDto personDto = PersonListDto(persons: persons, statusCode: statusCode, reasonPhrase: reasonPhrase, page: page, totalPages: totalPages);
    // TODO: implement fetchPersons
    throw UnimplementedError();
  }

  @override
  Future<PersonDetailModel> getPerson(int id) {
    // TODO: implement getPerson
    throw UnimplementedError();
  }
}
