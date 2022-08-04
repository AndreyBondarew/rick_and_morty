import 'dart:async';

import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/location_list_dto.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/location/query/fetch_list.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/location/contract/list_contract.dart';

import '../../core/common/eventbus/contract/eventbus_contract.dart';
import '../../core/common/model/location_list.dart';
import '../../core/entities/location/query/dispatcher/dispatcher.dart';

class LocationListViewModel implements LocationListViewModelContract, EventBusListener {
  final LocationQueryDispatcher _dispatcher;
  final EventBusContract _eventBus;
  final List<LocationListModel> _locations = [];
  final StreamController<LocationListNotifier> _notificationController = StreamController.broadcast();
  int _nextPage = 1;
  int? _totalPages;

  LocationListViewModel(this._dispatcher, this._eventBus) {
    _eventBus.addListener(this);
  }

  @override
  void dispose() {
    _eventBus.removeListener(this);
    _notificationController.close();
  }

  @override
  Future<void> load() async {
    _notificationController.add(LocationListStartLoadingNotifier());
    if (_totalPages != null && _nextPage > _totalPages!) {
      _notificationController.add(LocationListNothingLoadingNotifier());
      return;
    }
    try {
      LocationListDto res = await _dispatcher.dispatch(LocationFetchListQuery(_nextPage));
      _totalPages = res.totalPages;
      if (res.locations.isNotEmpty) {
        _locations.addAll(res.locations);
        _nextPage++;
        _notificationController.add(LocationListSuccessLoadNotifier(_locations));
        return;
      }
      _notificationController.add(LocationListErrorLoadingNotifier('API returned empty data'));
    } catch (e) {
      _notificationController.add(LocationListErrorLoadingNotifier(e.toString()));
    }
  }

  @override
  // TODO: implement notifier
  Stream<LocationListNotifier> get notifier => _notificationController.stream;

  @override
  void handle(Event event) {
    // TODO: implement handle
  }
}
