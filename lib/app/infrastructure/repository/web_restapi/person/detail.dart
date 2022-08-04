import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_test_restapi/app/infrastructure/repository/web_restapi/util.dart';

import '../../../../core/common/model/location_list.dart';
import '../../../../core/common/model/person_detail_model.dart';
import '../../../../core/entities/person/repository/base_repository.dart';
import '../constant.dart';
import '../exception.dart';

class PersonDetailRestRepository extends PersonDetailBaseRepository {
  final String _baseUrl = '$baseApiUrl$characterEndpoint';

  PersonDetailRestRepository();

  Future<LocationListModel> _getLocation(String url) async {
    if (url.isEmpty) {
      return LocationListModel(id: -1, name: 'unknown', type: 'unknown', dimension: 'unknown');
    }
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return LocationListModel.fromJson(jsonDecode(response.body));
    }
    throw RestApiRepositoryException(
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase,
      endPoint: url,
    );
  }

  /*Future<List<EpisodeListModel>> _getEpisodeList(List<dynamic> url) async {
    String apiEndpoint = '$baseApiUrl/$episodeEndpoint/${createFilterFromUrls(url)}';
    var response = await http.get(Uri.parse(apiEndpoint));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return [EpisodeListModel(id: 1, name: 'name', episode: 'episode', airDate: 'airDate')];
    }
    throw RestApiRepositoryException(
        statusCode: response.statusCode, reasonPhrase: response.reasonPhrase, endPoint: '$_baseUrl/${createFilterFromUrls(url)}');
  }*/

  @override
  Future<PersonDetailModel> getPerson(int id) async {
    var response = await http.get(Uri.parse('$_baseUrl/$id'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return PersonDetailModel.fromJson(
        data,
        originLocation: await _getLocation(data['origin']['url']),
        endpointLocation: await _getLocation(data['location']['url']),
        episodesId: createIdListFromUrls(data['episode']),
      );
    }
    throw RestApiRepositoryException(statusCode: response.statusCode, reasonPhrase: response.reasonPhrase, endPoint: '$_baseUrl/$id');
  }
}
