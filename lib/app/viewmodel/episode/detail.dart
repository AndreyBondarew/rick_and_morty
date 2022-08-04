import 'dart:async';

import 'package:rick_and_morty_test_restapi/app/core/common/eventbus/contract/eventbus_contract.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/dispatcher/dispatcher.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/get_episode.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/episode/contract/detail_contract.dart';

class EpisodeDetailViewModel implements EpisodeDetailViewModelContract, EventBusListener {
  final EpisodeQueryDispatcher _dispatcher;
  final EventBusContract _eventBus;
  final StreamController<EpisodeDetailNotifier> _notificationController = StreamController.broadcast();

  EpisodeDetailViewModel(this._dispatcher, this._eventBus) {
    _eventBus.addListener(this);
  }

  @override
  void dispose() {
    _eventBus.removeListener(this);
    _notificationController.close();
  }

  @override
  Future<void> load(int id) async {
    try {
      _notificationController.add(
        EpisodeDetailSuccessLoadingNotifier(
          await _dispatcher.dispatch(
            GetEpisodeQuery(id),
          ),
        ),
      );
    } catch (e) {
      _notificationController.add(EpisodeDetailErrorNotifier(e.toString()));
    }
  }

  @override
  // TODO: implement notifier
  Stream<EpisodeDetailNotifier> get notifier => _notificationController.stream;

  @override
  void handle(Event event) {
    // TODO: implement handle
  }
}
