import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/common/model/dto/location_list_dto.dart';
import '../../../../core/common/model/location_list.dart';
import '../../../../core/entities/location/repository/base_repository.dart';
import '../constant.dart';
import '../exception.dart';

class LocationListRestRepository extends LocationListBaseRepository {
  final String _baseUrl = '$baseApiUrl$locationEndpoint';

  @override
  Future<LocationListDto> fetchLocationList(int page) async {
    var response = await http.get(Uri.parse('$_baseUrl/?page=$page'));
    if (response.statusCode == 200) {
      final List<LocationListModel> locations = [];
      final dynamic jsonData = jsonDecode(response.body);
      final List<dynamic> jsonResults = jsonData['results'];
      for (var element in jsonResults) {
        locations.add(LocationListModel.fromJson(element));
      }
      return LocationListDto(locations: locations, currentPage: page, totalPages: jsonData['info']['pages']);
    }
    throw RestApiRepositoryException(
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase,
      endPoint: '$_baseUrl/?page=$page',
    );
  }
}
