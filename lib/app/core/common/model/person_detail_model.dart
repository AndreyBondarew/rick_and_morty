class PersonDetailModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;

  //LocationListModel? originLocation;
  final String? originLocationName;
  final String? originLocationUrl;
  //LocationListModel? endpointLocation;
  final String? endpointLocationName;
  final String? endpointLocationUrl;
  final String? episodeUrl;
  final String avatarUrl;

  PersonDetailModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    /*this.originLocation,
    this.endpointLocation,*/
    this.originLocationName,
    this.originLocationUrl,
    this.endpointLocationName,
    this.endpointLocationUrl,
    this.episodeUrl,
    required this.avatarUrl,
  });

  factory PersonDetailModel.fromJson(var jsonItem) {
    return PersonDetailModel(
      id: jsonItem['id'],
      name: jsonItem['name'],
      status: jsonItem['status'],
      species: jsonItem['species'],
      type: jsonItem['type'],
      gender: jsonItem['gender'],
      originLocationName: jsonItem['origin']['name'],
      originLocationUrl: jsonItem['origin']['url'],
      endpointLocationName: jsonItem['location']['name'],
      endpointLocationUrl: jsonItem['location']['url'],
      /*locationName: jsonItem['locationName'],
      locationUrl: jsonItem['locationUrl'],*/
      avatarUrl: jsonItem['image'],
    );
  }

  /*void setOriginLocation(LocationListModel? location) => originLocation = location;

  void setEndpointLocation(LocationListModel? location) => endpointLocation = location;

  void setLocations(LocationListModel? originLocation, LocationListModel? endpointLocation) {
    setOriginLocation(originLocation);
    setEndpointLocation(endpointLocation);
  }*/
}
