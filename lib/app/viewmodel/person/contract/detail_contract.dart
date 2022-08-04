import '../../../core/common/model/person_detail_model.dart';

abstract class PersonDetailViewModelContract {
  Stream<PersonDetailNotifier> get notification;
  Future<void> load(int id);
  void dispose();
}

class PersonDetailNotifier {}

class PersonDetailSuccessLoadNotifier implements PersonDetailNotifier {
  final PersonDetailModel person;
  PersonDetailSuccessLoadNotifier(this.person);
}

class PersonDetailErrorLoadingNotification implements PersonDetailNotifier {
  final String? message;

  PersonDetailErrorLoadingNotification(this.message);
}
