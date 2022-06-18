import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/person_list_model.dart';
import 'error_response.dart';

class PersonListRepository {
  final String urlApi = "https://rickandmortyapi.com/api/character/?page=";
  static PersonListRepository? _instance;
  int page = 1;

  PersonListRepository._();

  factory PersonListRepository(){
    _instance ??= PersonListRepository._();
    return _instance!;
  }

  Future<List<PersonListItemModel>> getListPersons() async {
    List<PersonListItemModel> result = [];
    var response = await http.get(Uri.parse(urlApi+page.toString()));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> jsonResult = jsonResponse['results'];
      for (var element in jsonResult) {
        result.add(PersonListItemModel(
            id: element['id'], name: element['name'], status: element['status'], species: element['species'], url: element['image']));
      }
    }else{
      throw ErrorResponseException(errorMessage: response.statusCode.toString());
    }
    return result;
  }
}
