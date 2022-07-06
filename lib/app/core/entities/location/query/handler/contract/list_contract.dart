import 'package:rik_and_morti_rest/app/core/common/base/query/base_query_handler.dart';
import 'package:rik_and_morti_rest/app/core/common/model/location_list.dart';
import 'package:rik_and_morti_rest/app/core/entities/location/query/fetch_list.dart';

abstract class LocationListQueryHandlerContract implements BaseQueryHandler<LocationFetchListQuery, List<LocationListModel>> {}
