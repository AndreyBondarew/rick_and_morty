import 'package:rik_and_morti_rest/app/core/common/base/query/base_query_handler.dart';
import 'package:rik_and_morti_rest/app/core/common/model/person_detail_model.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/get_person.dart';

abstract class PersonDetailQueryHandlerContract extends BaseQueryHandler<GetPersonFromId, PersonDetailModel> {}
