import '../../../core/common/model/person_list_model.dart';

abstract class PersonListViewModelContract {
  Future<void> load();
  Stream<PersonListNotifier> get notification;
  void dispose();
}

class PersonListNotifier {}

class PersonListSuccessLoadNotifier implements PersonListNotifier {
  List<PersonListModel> persons;

  PersonListSuccessLoadNotifier(this.persons);
}

class PersonalListStartLoadingNotifier implements PersonListNotifier {}

class PersonListNothingLoadingNotifier implements PersonListNotifier {}
