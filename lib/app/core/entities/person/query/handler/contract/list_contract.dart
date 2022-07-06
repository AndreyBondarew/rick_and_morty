import '../../../../../common/base/query/base_query_handler.dart';
import '../../../../../common/model/dto/person_list_dto.dart';
import '../../fetch_list.dart';

abstract class PersonListQueryHandlerContract extends BaseQueryHandler<PersonsFetchListQuery, PersonListDto> {}
