class PersonDetailModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String? originName;
  final String locationName;
  final String locationUrl;
  final String? episodeUrl;
  final String avatarUrl;

  PersonDetailModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      this.originName,
      required this.locationName,
      required this.locationUrl,
      this.episodeUrl,
      required this.avatarUrl});

  factory PersonDetailModel.fromJson(var jsonItem) {
    return PersonDetailModel(
      id: jsonItem['id'],
      name: jsonItem['name'],
      status: jsonItem['status'],
      species: jsonItem['species'],
      type: jsonItem['type'],
      gender: jsonItem['gender'],
      locationName: jsonItem['locationName'],
      locationUrl: jsonItem['locationUrl'],
      avatarUrl: jsonItem['avatarUrl'],
    );
  }
}
