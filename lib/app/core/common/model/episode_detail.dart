import 'person_list_model.dart';

class EpisodeDetailModel {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<PersonListModel> persons;
  final String episodeOwnEndpoint;

  EpisodeDetailModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.persons,
    required this.episodeOwnEndpoint,
  });
}

//==============================================
