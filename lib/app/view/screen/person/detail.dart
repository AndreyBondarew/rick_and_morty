import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_restapi/app/view/widget/person/detail.dart';

class PersonDetailScreen extends StatelessWidget {
  final int id;
  final String? name;
  const PersonDetailScreen({Key? key, required this.id, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail info: $name'),
      ),
      body: PersonDetailWidget(id: id),
    );
  }
}
