import 'dart:async';

import 'package:rick_and_morty_test_restapi/app/viewmodel/location/contract/list_contract.dart';

import '../../core/common/eventbus/contract/eventbus_contract.dart';
import '../../core/common/model/location_list.dart';
import '../../core/entities/location/query/dispatcher/dispatcher.dart';

class LocationListViewModel implements LocationListViewModelContract, EventBusListener {
  final LocationQueryDispatcher _dispatcher;
  final EventBusContract _eventBus;
  List<LocationListModel> locations = [];
  final StreamController<LocationListNotifier> _notifier = StreamController.broadcast();
  int _nextPage = 1;
  int? _totalPage;

  LocationListViewModel(this._dispatcher, this._eventBus) {
    _eventBus.addListener(this);
  }

  @override
  void dispose() {
    _eventBus.removeListener(this);
    _notifier.close();
  }

  @override
  Future<void> load() {
    // TODO: implement load
    throw UnimplementedError();
  }

  @override
  // TODO: implement notifier
  Stream<LocationListNotifier> get notifier => _notifier.stream;

  @override
  void handle(Event event) {
    // TODO: implement handle
  }
}
