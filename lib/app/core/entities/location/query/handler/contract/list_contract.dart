import '../../../../../common/base/query/base_query_handler.dart';
import '../../../../../common/model/location_list.dart';
import '../../fetch_list.dart';

abstract class LocationListQueryHandlerContract implements BaseQueryHandler<LocationFetchListQuery, List<LocationListModel>> {}
