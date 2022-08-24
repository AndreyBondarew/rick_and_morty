import 'dart:async';

import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/eventbus/contract/eventbus_contract.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/episode_list_dto.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/fetch_list.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/fetch_multiple_list.dart';

import '../../core/common/model/episode_list.dart';
import '../../core/entities/episode/query/dispatcher/dispatcher.dart';
import 'contract/list_contract.dart';

class EpisodeListViewModel implements EpisodeListViewModelContract, EventBusListener {
  final List<EpisodeListModel> _episodes = [];
  final EpisodeQueryDispatcher _dispatcher;
  final EventBusContract _eventBus;
  final StreamController<EpisodeListNotifier> _notificationController = StreamController.broadcast();
  int _nextPage = 1;
  int? _totalPages;

  EpisodeListViewModel(this._dispatcher, this._eventBus) {
    _eventBus.addListener(this);
  }

  @override
  void dispose() {
    _notificationController.close();
    _eventBus.removeListener(this);
  }

  @override
  Future<void> load({BaseFilter? filter}) async {
    _notificationController.add(EpisodeListNowLoadingNotifier());
    if (_totalPages != null && _nextPage > _totalPages!) {
      _notificationController.add(EpisodeListNothingLoadingNotifier());
      return;
    }
    try {
      EpisodeListDto episodeListDto = filter == null
          ? await _dispatcher.dispatch(EpisodeFetchListQuery(_nextPage))
          : await _dispatcher.dispatch(EpisodeFilteredFetchListQuery(filter));
      _totalPages = episodeListDto.totalPages;
      if (episodeListDto.episodes.isNotEmpty) {
        _nextPage++;
        _episodes.addAll(episodeListDto.episodes);
        _notificationController.add(EpisodeListSuccessLoadNotifier(_episodes));
        return;
      }
    } catch (e) {
      //print(e.toString());
      _notificationController.add(EpisodeListErrorLoadingNotifier(e.toString()));
    }
    //TODO обработка пустых данных
  }

  @override
  Stream<EpisodeListNotifier> get notifier => _notificationController.stream;

  @override
  void handle(Event event) {
    // TODO: implement handle
  }
}
