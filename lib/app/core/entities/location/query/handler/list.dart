import 'package:rik_and_morti_rest/app/core/common/model/location_list.dart';
import 'package:rik_and_morti_rest/app/core/entities/location/query/fetch_list.dart';
import 'package:rik_and_morti_rest/app/core/entities/location/query/handler/contract/list_contract.dart';
import 'package:rik_and_morti_rest/app/core/entities/location/repository/base_repository.dart';

class LocationListQueryHandler implements LocationListQueryHandlerContract {
  final LocationBaseRepository repository;

  LocationListQueryHandler(this.repository);

  @override
  Future<List<LocationListModel>> execute(LocationFetchListQuery query) async {
    return repository.fetchLocationList(query.page);
  }
}
