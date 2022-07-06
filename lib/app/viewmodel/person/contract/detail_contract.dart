import '../../../core/common/model/person_detail_model.dart';

abstract class PersonDetailViewModelContract {
  Stream<PersonDetailNotifier> get notification;
  Future<void> load(int id);
  void dispose();
}

class PersonDetailNotifier {}

class PersonDetailSuccessGetData implements PersonDetailNotifier {
  final PersonDetailModel person;
  PersonDetailSuccessGetData(this.person);
}
