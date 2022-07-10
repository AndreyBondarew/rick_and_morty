import '../../../common/base/base_repository.dart';
import '../../../common/model/dto/person_list_dto.dart';
import '../../../common/model/person_detail_model.dart';

abstract class PersonListBaseRepository implements BaseRepository {
  Future<PersonListDto> fetchPersons(int page);
}

abstract class PersonDetailBaseRepository implements BaseRepository {
  Future<PersonDetailModel> getPerson(int id);
}
