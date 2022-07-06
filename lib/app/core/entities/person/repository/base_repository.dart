import '../../../common/base/base_repository.dart';
import '../../../common/model/dto/person_list_dto.dart';
import '../../../common/model/person_detail_model.dart';

abstract class PersonBaseRepository implements BaseRepository {
  Future<PersonListDto> fetchPersons(int page);

  Future<PersonDetailModel> getPerson(int id);

  /* if Full RestAPI
  Future<void> save(PersonDetailModel person);

  Future<void> delete(int personId);

  Future<void> update(PersonDetailModel person);
  */
}
