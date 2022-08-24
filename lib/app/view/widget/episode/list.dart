import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/view/screen/episode/detail.dart';
import 'package:rick_and_morty_test_restapi/app/view/widget/episode/util.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/episode/contract/list_contract.dart';

import '../../../core/common/base/base_filter.dart';
import '../../../core/common/model/episode_list.dart';

class EpisodeListWidget extends StatefulWidget {
  final BaseFilter? filter;

  const EpisodeListWidget({super.key, this.filter});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<EpisodeListWidget> {
  final List<EpisodeListModel> _episodeList = [];
  final EpisodeListViewModelContract _viewModel = Injector().get<EpisodeListViewModelContract>();
  bool _isLoading = false;
  bool _availableData = true;

  @override
  void initState() {
    super.initState();
    _viewModel.notifier.listen((event) => _eventDispatcher(event));
    _viewModel.load(filter: widget.filter);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*Text(_episodeList.length.toString()),*/
        //Container(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              maxCrossAxisExtent: 330,
              mainAxisExtent: 120,
            ),
            itemBuilder: (ctx, index) => _buildItem(index),
            itemCount: _episodeList.length,
          ),
        ),
        _isLoading ? const LinearProgressIndicator() : Container(),
      ],
    );
  }

  Widget _buildItem(int index) {
    if (!_isLoading && _availableData && index >= _episodeList.length - 1 && widget.filter == null) {
      _viewModel.load();
    }
    //print(Colors.blueGrey.value /*SeasonEpisodeDTO.fromString(_episodeList[index].episode)*/);
    SeasonEpisodeDTO seasonDto = SeasonEpisodeDTO.fromString(_episodeList[index].episode);
    return Card(
      //color: Color(2284513675 * int.parse(seasonDto.season.substring(1))).withAlpha(50),
      elevation: 4,
      child: MaterialButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EpisodeDetailScreen(
              id: _episodeList[index].id,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 42,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  _episodeList[index].name,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.w800,
                    letterSpacing: .5,
                  ),
                ),
              ),
            ),
            Container(
              height: .5,
              color: Colors.blueGrey,
            ),
            RichText(
              text: TextSpan(
                text: 'Season: ',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(
                    text: seasonDto.season,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                  const TextSpan(text: ' episode: '),
                  TextSpan(
                    text: seasonDto.episode,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            //Text(seasonDto.toString()),
            Text(
              'air date: ${_episodeList[index].airDate}',
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  void _eventDispatcher(EpisodeListNotifier event) {
    if (event is EpisodeListNowLoadingNotifier) {
      setState(() => _isLoading = true);
    }
    if (event is EpisodeListSuccessLoadNotifier) {
      _episodeList.clear();
      setState(() {
        _isLoading = false;
        _episodeList.addAll(event.data);
      });
    }
    if (event is EpisodeListNothingLoadingNotifier) {
      _availableData = false;
      setState(() => _isLoading = false);
    }
    if (event is EpisodeListErrorLoadingNotifier) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${event.message}')));
      //Navigator.maybePop(context);
    }
  }
}
