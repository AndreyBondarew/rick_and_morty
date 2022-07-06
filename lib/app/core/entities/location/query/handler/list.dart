import '../../../../common/model/location_list.dart';
import '../../repository/base_repository.dart';
import '../fetch_list.dart';
import 'contract/list_contract.dart';

class LocationListQueryHandler implements LocationListQueryHandlerContract {
  final LocationBaseRepository repository;

  LocationListQueryHandler(this.repository);

  @override
  Future<List<LocationListModel>> execute(LocationFetchListQuery query) async {
    return repository.fetchLocationList(query.page);
  }
}
