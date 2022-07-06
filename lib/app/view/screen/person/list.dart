import 'package:flutter/material.dart';

import '../../widget/person/list.dart';

class PersonListScreen extends StatelessWidget {
  const PersonListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty: person list'),
      ),
      body: PersonListWidget(),
    );
  }
}
