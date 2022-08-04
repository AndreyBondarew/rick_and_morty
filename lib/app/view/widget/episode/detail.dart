import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/model/episode_detail.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/episode/contract/detail_contract.dart';

import '../../../core/entities/person/filter/multiple_list.dart';
import '../person/build_in_list.dart';

class EpisodeDetailWidget extends StatefulWidget {
  final int id;

  const EpisodeDetailWidget({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<EpisodeDetailWidget> {
  final EpisodeDetailViewModelContract _viewModel = Injector().get<EpisodeDetailViewModelContract>();
  bool _isLoading = true;
  EpisodeDetailModel? episodeModel;

  @override
  Widget build(BuildContext context) {
    if (_isLoading || episodeModel == null) {
      return Align(
        alignment: Alignment.topCenter,
        child: LinearProgressIndicator(),
      );
    }

    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Card(
          child: Column(
            children: [
              Text(episodeModel!.episode),
              PersonBuildInListWidget(filter: MultiplePersonListFilter(filter: episodeModel!.personsIds)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _viewModel.notifier.listen((event) => eventDispatcher(event));
    _viewModel.load(widget.id);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void eventDispatcher(EpisodeDetailNotifier event) {
    if (event is EpisodeDetailSuccessLoadingNotifier) {
      setState(() {
        episodeModel = event.episode;
        _isLoading = false;
      });
    }
  }
}
