import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/common/base/query/base_exception.dart';
import '../../../../core/common/model/dto/person_list_dto.dart';
import '../../../../core/common/model/person_list_model.dart';
import '../../../../core/entities/person/repository/base_repository.dart';
import '../constant.dart';

class PersonListRestRepository implements PersonListBaseRepository {
  final String _baseUrl = '$baseApiUrl$characterEndpoint';

  @override
  Future<PersonListDto> fetchPersons(int page) async {
    //print('load pages: $page');
    var response = await http.get(Uri.parse('$_baseUrl/?page=$page'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<PersonListModel> personsList = [];
      List<dynamic> jsonResult = jsonResponse['results'];
      for (var element in jsonResult) {
        personsList.add(PersonListModel.fromMap(element));
      }
      return PersonListDto(persons: personsList, page: page, totalPages: jsonResponse['info']['pages']);
    }
    throw InvalidQueryException(response.statusCode.toString() + (response.reasonPhrase != null ? response.reasonPhrase! : ' '));
  }
}
