import '../../../../../common/base/query/base_query_handler.dart';
import '../../../../../common/model/person_detail_model.dart';
import '../../get_person.dart';

abstract class PersonDetailQueryHandlerContract extends BaseQueryHandler<GetPersonFromId, PersonDetailModel> {}
