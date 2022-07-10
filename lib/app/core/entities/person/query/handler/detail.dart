import '../../../../common/model/person_detail_model.dart';
import '../../repository/base_repository.dart';
import '../get_person.dart';
import 'contract/detail_contract.dart';

class PersonDetailQueryHandler implements PersonDetailQueryHandlerContract {
  final PersonDetailBaseRepository repository;

  PersonDetailQueryHandler(this.repository);

  @override
  Future<PersonDetailModel> execute(GetPersonFromId query) {
    return repository.getPerson(query.id);
  }
}
