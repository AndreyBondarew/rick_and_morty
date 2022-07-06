import 'package:rik_and_morti_rest/app/core/common/base/query/base_query_handler.dart';
import 'package:rik_and_morti_rest/app/core/common/model/location_detail.dart';
import 'package:rik_and_morti_rest/app/core/entities/location/query/get_location.dart';

abstract class LocationDetailQueryHandlerContract implements BaseQueryHandler<GetLocationQuery, LocationDetailModel> {}
