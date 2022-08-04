import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_test_restapi/app/infrastructure/repository/web_restapi/util.dart';

import '../../../../core/common/model/episode_detail.dart';
import '../../../../core/entities/episode/repository/base_repository.dart';
import '../constant.dart';
import '../exception.dart';

class EpisodeDetailRestRepository implements EpisodeDetailBaseRepository {
  final String _baseApiUrl = '$baseApiUrl$episodeEndpoint';
  //final PersonListBaseRepository personListRepository;

  EpisodeDetailRestRepository(/*this.personListRepository*/);

  @override
  Future<EpisodeDetailModel> getEpisode(int id) async {
    var response = await http.get(Uri.parse('$_baseApiUrl/$id'));
    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      return EpisodeDetailModel.fromMap(jsonData, personsList: createIdListFromUrls(jsonData['characters']));
    }
    throw RestApiRepositoryException(
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase,
      endPoint: '$_baseApiUrl/$id',
    );
  }
}
