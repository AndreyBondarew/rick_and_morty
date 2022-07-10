import 'dart:async';

import 'package:rick_and_morty_test_restapi/app/core/entities/location/query/get_location.dart';

import '../../core/common/eventbus/contract/eventbus_contract.dart';
import '../../core/entities/location/query/dispatcher/dispatcher.dart';
import 'contract/detail_contract.dart';

class LocationDetailViewModel implements LocationDetailViewModelContract, EventBusListener {
  final LocationQueryDispatcher _dispatcher;
  final EventBusContract _eventBus;
  final StreamController<LocationDetailNotification> _notifyController = StreamController.broadcast();

  LocationDetailViewModel(this._dispatcher, this._eventBus);

  @override
  void dispose() {
    _eventBus.removeListener(this);
    _notifyController.close();
  }

  @override
  Future<void> load(int id) async {
    _notifyController.add(
      LocationDetailSuccessLoadNotification(
        await _dispatcher.dispatch(
          GetLocationQuery(id),
        ),
      ),
    );
  }

  @override
  // TODO: implement notifier
  Stream<LocationDetailNotification> get notifier => _notifyController.stream;

  @override
  void handle(Event event) {
    // TODO: implement handle
  }
}
