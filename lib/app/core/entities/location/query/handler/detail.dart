import 'package:rik_and_morti_rest/app/core/common/model/location_detail.dart';
import 'package:rik_and_morti_rest/app/core/entities/location/query/get_location.dart';
import 'package:rik_and_morti_rest/app/core/entities/location/query/handler/contract/detail_contract.dart';
import 'package:rik_and_morti_rest/app/core/entities/location/repository/base_repository.dart';

class LocationDetailQueryHandler implements LocationDetailQueryHandlerContract {
  final LocationBaseRepository repository;

  LocationDetailQueryHandler(this.repository);

  @override
  Future<LocationDetailModel> execute(GetLocationQuery query) {
    return repository.getLocation(query.locationId);
  }
}
