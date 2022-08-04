import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/common/model/dto/episode_list_dto.dart';
import '../../../../core/common/model/episode_list.dart';
import '../../../../core/entities/episode/repository/base_repository.dart';
import '../constant.dart';
import '../exception.dart';

class EpisodeListRestRepository implements EpisodeListBaseRepository {
  final String _baseUrl = '$baseApiUrl$episodeEndpoint';

  @override
  Future<EpisodeListDto> fetchList(int page) async {
    //EpisodeListDto _episode;
    var response = await http.get(Uri.parse('$_baseUrl/?page=$page'));
    if (response.statusCode == 200) {
      final List<EpisodeListModel> episodes = [];
      final dynamic jsonData = jsonDecode(response.body);
      jsonData['results'].forEach(
        (element) => episodes.add(
          EpisodeListModel.fromMap(element),
        ),
      );
      return EpisodeListDto(episodes: episodes, totalPages: jsonData['info']['pages'], currentPage: page);
    }
    throw RestApiRepositoryException(
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase,
      endPoint: '$_baseUrl/?page=$page',
    );
  }
}
