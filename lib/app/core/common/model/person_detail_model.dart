import 'package:rick_and_morty_test_restapi/app/core/common/model/location_list.dart';

class PersonDetailModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String avatarUrl;
  final List<String> episodesId;

  LocationListModel? originLocation;
  LocationListModel? endpointLocation;

  PersonDetailModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    this.originLocation,
    this.endpointLocation,
    this.episodesId = const [],
    required this.avatarUrl,
  });

  factory PersonDetailModel.fromJson(
    var jsonItem, {
    LocationListModel? originLocation,
    LocationListModel? endpointLocation,
    List<String>? episodesId,
  }) {
    return PersonDetailModel(
      id: jsonItem['id'],
      name: jsonItem['name'],
      status: jsonItem['status'],
      species: jsonItem['species'],
      type: jsonItem['type'],
      gender: jsonItem['gender'],
      originLocation: originLocation,
      endpointLocation: endpointLocation,
      episodesId: episodesId ?? [],
      avatarUrl: jsonItem['image'],
    );
  }

  void setOriginLocation(LocationListModel? location) => originLocation = location;

  void setEndpointLocation(LocationListModel? location) => endpointLocation = location;

  void setLocations(LocationListModel? originLocation, LocationListModel? endpointLocation) {
    setOriginLocation(originLocation);
    setEndpointLocation(endpointLocation);
  }

  void setEpisodes(List<String> episodeList) {
    episodesId.clear();
    episodesId.addAll(episodeList);
  }
}
