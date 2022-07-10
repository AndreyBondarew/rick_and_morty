import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_restapi/app/view/widget/person/detail.dart';

class PersonDetailScreen extends StatelessWidget {
  final int id;
  const PersonDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PersonDetailWidget(id: id),
    );
  }
}
