import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';

import '../../../core/common/model/person_list_model.dart';

abstract class PersonListViewModelContract {
  Future<void> load({BaseFilter? filter});
  Stream<PersonListNotifier> get notification;
  void dispose();
}

class PersonListNotifier {}

class PersonListSuccessLoadNotifier implements PersonListNotifier {
  List<PersonListModel> persons;

  PersonListSuccessLoadNotifier(this.persons);
}

class PersonListStartLoadingNotifier implements PersonListNotifier {}

class PersonListNothingLoadingNotifier implements PersonListNotifier {}

class PersonListErrorLoadingNotifier implements PersonListNotifier {
  final String? message;

  PersonListErrorLoadingNotifier([this.message]);
}
