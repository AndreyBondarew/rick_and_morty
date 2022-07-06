import 'package:rik_and_morti_rest/app/core/common/base/query/base_query_handler.dart';
import 'package:rik_and_morti_rest/app/core/common/model/dto/person_list_dto.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/fetch_list.dart';

abstract class PersonListQueryHandlerContract extends BaseQueryHandler<PersonsFetchListQuery, PersonListDto> {}
