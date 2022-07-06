import '../../../../../common/base/query/base_query_handler.dart';
import '../../../../../common/model/location_detail.dart';
import '../../get_location.dart';

abstract class LocationDetailQueryHandlerContract implements BaseQueryHandler<GetLocationQuery, LocationDetailModel> {}
