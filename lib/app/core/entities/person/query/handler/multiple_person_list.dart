import 'package:rick_and_morty_test_restapi/app/core/entities/person/query/fetch_multiple_list.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/person/query/handler/contract/multiple_person_list_contract.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/person/repository/base_repository.dart';

import '../../../../common/model/dto/person_list_dto.dart';

class MultiplePersonFetchListQueryHandler extends MultiplePersonFetchListQueryHandlerContract {
  final PersonListBaseRepository _repository;

  MultiplePersonFetchListQueryHandler(this._repository);

  @override
  Future<PersonListDto> execute(PersonsFilteredFetchListQuery query) {
    return _repository.fetchMultipleListPerson(query.filter);
  }
}
