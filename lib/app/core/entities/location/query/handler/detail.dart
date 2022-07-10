import '../../../../common/model/location_detail.dart';
import '../../repository/base_repository.dart';
import '../get_location.dart';
import 'contract/detail_contract.dart';

class LocationDetailQueryHandler implements LocationDetailQueryHandlerContract {
  final LocationDetailBaseRepository repository;

  LocationDetailQueryHandler(this.repository);

  @override
  Future<LocationDetailModel> execute(GetLocationQuery query) {
    return repository.getLocationFromId(query.locationId);
  }
}
