import 'dart:async';

import 'package:rick_and_morty_test_restapi/app/infrastructure/repository/person_list_repository.dart';

import '../core/common/model/person_list_model.dart';

class PersonListViewModel {
  final PersonListRepository repository = PersonListRepository();
  final StreamController<PersonListNotification> _streamController = StreamController.broadcast();

  Future<void> load() async {
    List<PersonListModel> persons = await repository.getListPersons();
    _streamController.add(ResultPersonListNotification(persons: persons));
  }

  Stream<PersonListNotification> get event {
    return _streamController.stream;
  }
}

class PersonListNotification {}

class ResultPersonListNotification implements PersonListNotification {
  final List<PersonListModel> persons;

  ResultPersonListNotification({required this.persons});
}

class ErrorPersonListNotification implements PersonListNotification {
  final String error;

  ErrorPersonListNotification({required this.error});
}
