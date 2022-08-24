import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/model/episode_detail.dart';
import 'package:rick_and_morty_test_restapi/app/view/widget/episode/util.dart';
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
      return const Align(
        alignment: Alignment.topCenter,
        child: LinearProgressIndicator(),
      );
    }

    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.topCenter,
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Episode name: ', //episodeModel!.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: [TextSpan(text: episodeModel!.name, style: const TextStyle(color: Colors.red))],
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Season: ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: SeasonEpisodeDTO.fromString(episodeModel!.episode).season,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              width: 1,
                              height: 15,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        const TextSpan(
                          text: 'Episode: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: SeasonEpisodeDTO.fromString(episodeModel!.episode).episode,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Date on air: ',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: episodeModel!.airDate,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      color: Colors.blueGrey,
                    ),
                  ),
                  PersonBuildInListWidget(filter: MultiplePersonListFilter(filter: episodeModel!.personsIds)),
                ],
              ),
            ),
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
