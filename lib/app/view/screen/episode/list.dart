import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';

import '../../widget/drawer/common_drawer.dart';
import '../../widget/episode/list.dart';

class EpisodeListScreen extends StatelessWidget {
  final BaseFilter? filter;

  const EpisodeListScreen({Key? key, this.filter}) : super(key: key);

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
          ? EpisodeListWidget(
              filter: filter,
            )
          : Row(
              children: [
                const SizedBox(
                  width: 300,
                  child: Menu(),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 300,
                  child: EpisodeListWidget(
                    filter: filter,
                  ),
                ),
              ],
            ),
    );
  }
}
