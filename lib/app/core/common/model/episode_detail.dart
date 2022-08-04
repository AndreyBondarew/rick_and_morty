class EpisodeDetailModel {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> personsIds;

  EpisodeDetailModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.personsIds,
  });

  factory EpisodeDetailModel.fromMap(Map<String, dynamic> data, {List<String> personsList = const []}) {
    return EpisodeDetailModel(
      id: data['id'],
      name: data['name'],
      airDate: data['air_date'],
      episode: data['episode'],
      personsIds: personsList,
    );
  }

  void setPersonsIds(List<String> personsList) {
    personsIds.addAll(personsList);
  }

  void clearPersons() {
    personsIds.clear();
  }
}

//==============================================
