import 'package:rik_and_morti_rest/app/core/common/model/dto/person_list_dto.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/fetch_list.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/handler/contract/list_contract.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/repository/base_repository.dart';

class PersonListQueryHandler implements PersonListQueryHandlerContract {
  final PersonBaseRepository repository;

  PersonListQueryHandler(this.repository);

  @override
  Future<PersonListDto> execute(PersonsFetchListQuery query) {
    return repository.fetchPersons(query.page);
  }
}
