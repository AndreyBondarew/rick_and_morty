import '../../../../common/model/dto/person_list_dto.dart';
import '../../repository/base_repository.dart';
import '../fetch_list.dart';
import 'contract/list_contract.dart';

class PersonListQueryHandler implements PersonListQueryHandlerContract {
  final PersonListBaseRepository repository;

  PersonListQueryHandler(this.repository);

  @override
  Future<PersonListDto> execute(PersonsFetchListQuery query) {
    return repository.fetchList(query.page);
  }
}
