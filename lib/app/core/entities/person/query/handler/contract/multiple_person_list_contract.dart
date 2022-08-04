import 'package:rick_and_morty_test_restapi/app/core/common/base/query/base_query_handler.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/person_list_dto.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/person/query/fetch_multiple_list.dart';

abstract class MultiplePersonFetchListQueryHandlerContract extends BaseQueryHandler<PersonsFilteredFetchListQuery, PersonListDto> {}
