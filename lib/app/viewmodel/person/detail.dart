import 'dart:async';

import '../../core/common/eventbus/contract/eventbus_contract.dart';
import '../../core/entities/person/query/dispatcher/dispatcher.dart';
import '../../core/entities/person/query/get_person.dart';
import 'contract/detail_contract.dart';

class PersonDetailViewModel implements PersonDetailViewModelContract, EventBusListener {
  final PersonQueryDispatcher _queryDispatcher;
  final EventBusContract _eventBus;
  final StreamController<PersonDetailNotifier> _notifyController = StreamController.broadcast();

  @override
  Stream<PersonDetailNotifier> get notification => _notifyController.stream;

  PersonDetailViewModel(this._queryDispatcher, this._eventBus) {
    _eventBus.addListener(this);
  }

  @override
  Future<void> load(int id) async {
    _notifyController.add(
      PersonDetailSuccessLoadNotifier(
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
