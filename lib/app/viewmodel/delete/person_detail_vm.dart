/*
import 'dart:async';

import '../core/common/model/person_detail_model.dart';
import '../infrastructure/repository/person_detail_repository.dart';

class PersonDetailViewModel_ {
  final PersonDetailRepository repository = PersonDetailRepository();
  final StreamController<PersonaDetailNotification> _controller = StreamController();
  bool isLoading = false;

  Future<void> load(int id) async {
    isLoading = false;
    PersonDetailModel person = await repository.load(id);
    isLoading = true;
    _controller.add(ResultPersonaDetailNotification(person: person));
  }

  Stream<PersonaDetailNotification> get event {
    return _controller.stream;
  }
}

class PersonaDetailNotification {}

class ResultPersonaDetailNotification implements PersonaDetailNotification {
  final PersonDetailModel? person;

  ResultPersonaDetailNotification({this.person});
}

class ErrorPersonDetailNotification implements PersonaDetailNotification {
  final String? error;

  ErrorPersonDetailNotification({this.error});
}
*/
