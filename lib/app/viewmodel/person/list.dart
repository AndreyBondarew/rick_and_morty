import 'dart:async';

import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/model/person_list_model.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/person/query/fetch_multiple_list.dart';

import '../../core/common/eventbus/contract/eventbus_contract.dart';
import '../../core/common/model/dto/person_list_dto.dart';
import '../../core/entities/person/query/dispatcher/dispatcher.dart';
import '../../core/entities/person/query/fetch_list.dart';
import 'contract/list_contract.dart';

class PersonListViewModel implements PersonListViewModelContract, EventBusListener {
  final PersonQueryDispatcher dispatcher;
  final EventBusContract _eventBus;
  final StreamController<PersonListNotifier> _notificationController = StreamController.broadcast();
  List<PersonListModel> personList = [];
  int _nextPage = 1;
  int? _totalPages;

  PersonListViewModel(this.dispatcher, this._eventBus) {
    _eventBus.addListener(this);
  }

  @override
  void dispose() {
    _eventBus.removeListener(this);
    _notificationController.close();
  }

  @override
  Future<void> load({BaseFilter? filter}) async {
    _notificationController.add(PersonListStartLoadingNotifier());
    if (_totalPages != null && _nextPage > _totalPages!) {
      _notificationController.add(PersonListNothingLoadingNotifier());
      return;
    }
    try {
      //print('load page $_nextPage');
      PersonListDto res = filter == null
          ? await dispatcher.dispatch(PersonsFetchListQuery(_nextPage))
          : await dispatcher.dispatch(PersonsFilteredFetchListQuery(filter));
      _totalPages = res.totalPages;
      if (res.persons.isNotEmpty) {
        personList.addAll(res.persons);
        _nextPage++;
        _notificationController.add(PersonListSuccessLoadNotifier(personList));
        return;
      }
      _notificationController.add(PersonListErrorLoadingNotifier('API returned empty data'));
    } catch (e) {
      _notificationController.add(PersonListErrorLoadingNotifier(e.toString()));
    }
  }

  @override
  Stream<PersonListNotifier> get notification => _notificationController.stream;

  @override
  void handle(Event event) {
    // TODO: implement handle if use EventBus
  }
}
