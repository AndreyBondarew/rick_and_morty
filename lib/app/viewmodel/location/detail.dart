import 'dart:async';

import 'package:rick_and_morty_test_restapi/app/core/common/model/location_detail.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/location/query/get_location.dart';

import '../../core/common/eventbus/contract/eventbus_contract.dart';
import '../../core/entities/location/query/dispatcher/dispatcher.dart';
import 'contract/detail_contract.dart';

class LocationDetailViewModel implements LocationDetailViewModelContract, EventBusListener {
  final LocationQueryDispatcher _dispatcher;
  final EventBusContract _eventBus;
  final StreamController<LocationDetailNotifier> _notifyController = StreamController.broadcast();

  LocationDetailViewModel(this._dispatcher, this._eventBus) {
    _eventBus.addListener(this);
  }

  @override
  void dispose() {
    _eventBus.removeListener(this);
    _notifyController.close();
  }

  @override
  Future<void> load(int id) async {
    if (id == -1) {
      _notifyController.add(LocationDetailSuccessLoadNotifier(
          LocationDetailModel(id: -1, name: 'unknown', dimension: 'unknown', residentsIds: [], type: 'unknown')));
      return;
    }
    try {
      _notifyController.add(
        LocationDetailSuccessLoadNotifier(
          await _dispatcher.dispatch(
            GetLocationQuery(id),
          ),
        ),
      );
    } catch (e) {
      //print('error ${e.toString()}');
      _notifyController.add(LocationDetailLoadingErrorNotifier(e.toString()));
    }
  }

  @override
  Stream<LocationDetailNotifier> get notifier => _notifyController.stream;

  @override
  void handle(Event event) {
    // TODO: implement handle
  }
}
