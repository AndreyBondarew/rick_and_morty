import 'package:rik_and_morti_rest/app/core/common/model/person_detail_model.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/get_person.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/repository/base_repository.dart';

import 'contract/detail_contract.dart';

class PersonDetailQueryHandler implements PersonDetailQueryHandlerContract {
  final PersonBaseRepository repository;

  PersonDetailQueryHandler(this.repository);

  @override
  Future<PersonDetailModel> execute(GetPersonFromId query) {
    return repository.getPerson(query.id);
  }
}
