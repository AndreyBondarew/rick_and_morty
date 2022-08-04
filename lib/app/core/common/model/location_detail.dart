class LocationDetailModel {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residentsIds;

  LocationDetailModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residentsIds,
  });

  factory LocationDetailModel.fromJson(var data, {List<String> residentsIds = const []}) {
    return LocationDetailModel(
      id: data['id'],
      name: data['name'],
      type: data['type'],
      dimension: data['dimension'],
      residentsIds: residentsIds,
    );
  }
}
