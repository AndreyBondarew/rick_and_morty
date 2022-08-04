import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';

import '../../../common/base/base_repository.dart';
import '../../../common/model/dto/person_list_dto.dart';
import '../../../common/model/person_detail_model.dart';

abstract class PersonListBaseRepository implements BaseRepository {
  Future<PersonListDto> fetchList(int page);
  Future<PersonListDto> fetchMultipleListPerson(BaseFilter filter);
}

abstract class PersonDetailBaseRepository implements BaseRepository {
  Future<PersonDetailModel> getPerson(int id);
}
