class EpisodeListModel {
  final int id;
  final String name;
  final String episode;
  final String airDate;

  EpisodeListModel({
    required this.id,
    required this.name,
    required this.episode,
    required this.airDate,
  });

  factory EpisodeListModel.fromMap(Map<String, dynamic> data) {
    return EpisodeListModel(
      id: data['id'],
      name: data['name'],
      episode: data['episode'],
      airDate: data['air_date'],
    );
  }
}
