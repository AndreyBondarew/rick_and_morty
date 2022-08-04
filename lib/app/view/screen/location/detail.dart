import 'package:flutter/material.dart';

import '../../widget/location/detail.dart';

class LocationDetailScreen extends StatelessWidget {
  final int id;

  const LocationDetailScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LocationDetailWidget(id: id),
    );
  }
}
