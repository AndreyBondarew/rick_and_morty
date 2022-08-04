import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_restapi/app/view/widget/episode/detail.dart';

class EpisodeDetailScreen extends StatelessWidget {
  final int id;

  const EpisodeDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EpisodeDetailWidget(
        id: id,
      ),
    );
  }
}
