import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/location_list_dto.dart';

import '../../../../../common/base/query/base_query_handler.dart';
import '../../fetch_list.dart';

abstract class LocationListQueryHandlerContract implements BaseQueryHandler<LocationFetchListQuery, LocationListDto> {}
