import 'dart:async';

import 'package:flutter/foundation.dart';

import '../model/person_list_model.dart';
import '../repository/person_list_repository.dart';

class PersonListViewModel {
  final PersonListRepository repository = PersonListRepository();
  final StreamController<PersonListNotification> _streamController = StreamController.broadcast();

  Future<void> load() async{
    List<PersonListItemModel> persons = await repository.getListPersons();
    _streamController.add(ResultPersonListNotification(persons: persons));
  }

  Stream<PersonListNotification> get event{
    return _streamController.stream;
  }
}

class PersonListNotification {}

class ResultPersonListNotification implements PersonListNotification {
  final List<PersonListItemModel> persons;

  ResultPersonListNotification({required this.persons});
}

class ErrorPersonListNotification implements PersonListNotification {
  final String error;

  ErrorPersonListNotification({required this.error});
}
