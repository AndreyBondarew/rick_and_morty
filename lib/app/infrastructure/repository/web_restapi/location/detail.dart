import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/common/model/location_detail.dart';
import '../../../../core/entities/location/repository/base_repository.dart';
import '../constant.dart';
import '../exception.dart';
import '../util.dart';

class LocationDetailRestRepository implements LocationDetailBaseRepository {
  final String _baseUrl = '$baseApiUrl$locationEndpoint';

  LocationDetailRestRepository();

  @override
  Future<LocationDetailModel> getLocationFromId(int id) async {
    var response = await http.get(Uri.parse('$_baseUrl/$id'));
    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      return LocationDetailModel.fromJson(
        jsonData,
        residentsIds: createIdListFromUrls(jsonData['residents']),
      );
    }
    throw RestApiRepositoryException(
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase,
      endPoint: '$_baseUrl/$id',
    );
  }
}
