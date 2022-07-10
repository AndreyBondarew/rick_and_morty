class LocationListModel {
  final int id;
  final String name;
  final String type;

  LocationListModel({
    required this.id,
    required this.name,
    required this.type,
  });

  factory LocationListModel.fromJson(Map<String, dynamic> data) {
    return LocationListModel(id: data['id'], name: data['name'], type: data['type']);
  }
}
