import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_restapi/app/view/widget/drawer/common_drawer.dart';
import 'package:rick_and_morty_test_restapi/app/view/widget/location/list.dart';

class LocationListScreen extends StatelessWidget {
  const LocationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location list:'),
      ),
      drawer: (MediaQuery.of(context).size.width < 600) ? const Drawer(child: Menu()) : null,
      body: SafeArea(
        child: Center(
          child: (MediaQuery.of(context).size.width < 600)
              ? const LocationListWidget()
              : Row(
                  children: [
                    const SizedBox(width: 300, child: Menu()),
                    SizedBox(width: MediaQuery.of(context).size.width - 300, child: const LocationListWidget())
                  ],
                ),
        ),
      ),
    );
  }
}
