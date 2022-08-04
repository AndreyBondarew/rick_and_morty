class PersonListModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String avatarUri;

  PersonListModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.avatarUri,
  });

  factory PersonListModel.fromMap(Map<String, dynamic> data) {
    return PersonListModel(
      id: data['id'],
      name: data['name'],
      status: data['status'],
      species: data['species'],
      avatarUri: data['image'],
    );
  }

/*  @override
  String toString() {
    return ('Name: $name ');
  }*/
}
