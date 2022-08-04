import 'package:flutter/material.dart';

import '../../widget/drawer/common_drawer.dart';
import '../../widget/episode/list.dart';

class EpisodeListScreen extends StatelessWidget {
  const EpisodeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode list:'),
      ),
      drawer: (MediaQuery.of(context).size.width < 600)
          ? const Drawer(
              child: Menu(),
            )
          : null,
      body: MediaQuery.of(context).size.width < 600
          ? const EpisodeListWidget()
          : Row(
              children: [
                const SizedBox(
                  width: 300,
                  child: Menu(),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 300,
                  child: const EpisodeListWidget(),
                ),
              ],
            ),
    );
  }
}
