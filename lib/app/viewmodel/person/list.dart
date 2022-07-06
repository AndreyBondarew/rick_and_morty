import 'dart:async';

import 'package:rik_and_morti_rest/app/core/common/eventbus/contract/eventbus_contract.dart';
import 'package:rik_and_morti_rest/app/core/common/model/dto/person_list_dto.dart';
import 'package:rik_and_morti_rest/app/core/common/model/person_list_model.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/dispatcher/dispatcher.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/fetch_list.dart';
import 'package:rik_and_morti_rest/app/viewmodel/person/contract/list_contract.dart';

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
  Future<void> load() async {
    _notificationController.add(PersonalListStartLoadingNotifier());
    if (_totalPages != null && _nextPage > _totalPages!) {
      _notificationController.add(PersonListNothingLoadingNotifier());
      return;
    }
    PersonListDto res = await dispatcher.dispatch(PersonsFetchListQuery(_nextPage));
    _totalPages = res.totalPages;
    if (res.persons.isNotEmpty) {
      personList.addAll(res.persons);
      _nextPage++;
      _notificationController.add(PersonListSuccessLoadNotifier(personList));
    }
  }

  @override
  Stream<PersonListNotifier> get notification => _notificationController.stream;

  @override
  void handle(Event event) {
    // TODO: implement handle if use EventBus
  }
}
