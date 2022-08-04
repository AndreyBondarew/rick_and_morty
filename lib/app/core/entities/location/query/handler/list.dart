import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/location_list_dto.dart';

import '../../repository/base_repository.dart';
import '../fetch_list.dart';
import 'contract/list_contract.dart';

class LocationListQueryHandler implements LocationListQueryHandlerContract {
  final LocationListBaseRepository repository;

  LocationListQueryHandler(this.repository);

  @override
  Future<LocationListDto> execute(LocationFetchListQuery query) async {
    return repository.fetchLocationList(query.page);
  }
}
