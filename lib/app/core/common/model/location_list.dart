class LocationListModel {
  final int id;
  final String name;
  final String type;
  final String dimension;

  LocationListModel({required this.id, required this.name, required this.type, required this.dimension});

  factory LocationListModel.fromJson(Map<String, dynamic> data) {
    return LocationListModel(
      id: data['id'],
      name: data['name'],
      type: data['type'],
      dimension: data['dimension'],
    );
  }
}
