import 'dart:async';

import 'package:rik_and_morti_rest/app/core/common/eventbus/contract/eventbus_contract.dart';
import 'package:rik_and_morti_rest/app/core/common/eventbus/eventbus.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/dispatcher/dispatcher.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/get_person.dart';
import 'package:rik_and_morti_rest/app/viewmodel/person/contract/detail_contract.dart';

class PersonDetailViewModel implements PersonDetailViewModelContract, EventBusListener {
  final PersonQueryDispatcher _queryDispatcher;
  final EventBus _eventBus;
  final StreamController<PersonDetailNotifier> _notifyController = StreamController.broadcast();

  @override
  Stream<PersonDetailNotifier> get notification => _notifyController.stream;

  PersonDetailViewModel(this._eventBus, this._queryDispatcher) {
    _eventBus.addListener(this);
  }

  @override
  Future<void> load(int id) async {
    _notifyController.add(
      PersonDetailSuccessGetData(
        await _queryDispatcher.dispatch(
          GetPersonFromId(id),
        ),
      ),
    );
  }

  @override
  void handle(Event event) {
    // TODO: implement handle
  }

  @override
  void dispose() {
    _eventBus.removeListener(this);
    _notifyController.close();
  }
}
