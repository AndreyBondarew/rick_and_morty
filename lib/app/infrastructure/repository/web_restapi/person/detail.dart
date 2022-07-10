import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/common/model/person_detail_model.dart';
import '../../../../core/entities/person/repository/base_repository.dart';
import '../constant.dart';

class PersonDetailRestRepository extends PersonDetailBaseRepository {
  final String _baseUrl = '$baseApiUrl$characterEndpoint';
  //final LocationListBaseRepository _locationRepository;

  PersonDetailRestRepository(
      //this._locationRepository
      );

  @override
  Future<PersonDetailModel> getPerson(int id) async {
    var response = await http.get(Uri.parse('$_baseUrl/$id'));
    if (response.statusCode == 200) {
      return PersonDetailModel.fromJson(
        jsonDecode(response.body),
      );
    }
    // TODO: implement getPerson
    throw UnimplementedError();
  }
}
