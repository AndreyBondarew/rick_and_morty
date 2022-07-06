import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/common/model/person_detail_model.dart';
import 'error_response.dart';

class PersonDetailRepository {
  final String preUrl = 'https://rickandmortyapi.com/api/character/';
  static PersonDetailRepository? _instance;

  PersonDetailRepository._();

  factory PersonDetailRepository() {
    _instance ??= PersonDetailRepository._();
    return _instance!;
  }

  Future<PersonDetailModel> load(int id) async {
    var response = await http.get(Uri.parse(preUrl + id.toString()));
    if (response.statusCode == 200) {
      var item = jsonDecode(response.body);
      return (PersonDetailModel(
        id: item['id'],
        name: item['name'],
        avatarUrl: item['image'],
        species: item['species'],
        status: item['status'],
        gender: item['gender'],
        locationName: item['location']['name'],
        locationUrl: item['location']['url'],
        originName: item['originName'],
        type: item['type'],
        //episodeUrl: item['episode']
      ));
    } else {
      throw ErrorResponseException(errorMessage: response.statusCode.toString());
    }
  }
}
