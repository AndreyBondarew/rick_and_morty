import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/base/exception.dart';
import 'package:rick_and_morty_test_restapi/app/view/screen/episode/detail.dart';
import 'package:rick_and_morty_test_restapi/app/view/widget/episode/util.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/episode/contract/list_contract.dart';

import '../../../core/common/model/episode_list.dart';

class EpisodeBuildInListWidget extends StatefulWidget {
  final BaseFilter? filter;

  const EpisodeBuildInListWidget({super.key, this.filter});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<EpisodeBuildInListWidget> {
  final List<EpisodeListModel> _episodeList = [];
  final EpisodeListViewModelContract _viewModel = Injector().get<EpisodeListViewModelContract>();
  final int expandItemCount = 5;
  bool expand = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _viewModel.notifier.listen((event) => _dispatch(event));
    _viewModel.load(filter: widget.filter);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (expand) {
      return Expanded(child: _buildContent());
    }
    return _buildContent();
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildList(),
        if (_episodeList.length > expandItemCount)
          TextButton(
            onPressed: () => setState(() {
              expand = !expand;
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(expand ? 'collapse' : 'expand (${_episodeList.length - expandItemCount} element)'),
                Icon(expand ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined),
              ],
            ),
          )
      ],
    );
  }

  Widget _buildList() {
    return ListView.builder(itemBuilder: (ctx, index) {
      return Padding(
        padding: const EdgeInsets.all(4),
        child: ListTile(
          title: Text(
            _episodeList[index].name,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            SeasonEpisodeDTO.fromString(_episodeList[index].episode).toString(),
            style: const TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w300,
              fontSize: 11,
            ),
          ),
          onTap: () =>
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => EpisodeDetailScreen(id: _episodeList[index].id))),
        ),
      );
    });
  }

  void _dispatch(EpisodeListNotifier event) {
    if (event is EpisodeListSuccessLoadNotifier) {
      setState(() {
        _isLoading = false;
        _episodeList.clear();
        _episodeList.addAll(event.data);
      });
    }
    if (event is EpisodeListNowLoadingNotifier) {
      setState(() {
        _isLoading = true;
      });
    }
    if (event is EpisodeListNothingLoadingNotifier) {
      setState(() {
        _isLoading = false;
      });
    }
    if (event is EpisodeListErrorLoadingNotifier) {
      setState(() {
        _isLoading = false;
      });
      throw BaseAppException(event.message);
    }
  }
}
