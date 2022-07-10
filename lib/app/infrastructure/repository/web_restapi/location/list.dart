import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/location_list_dto.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/location/repository/base_repository.dart';

import '../../../../core/common/model/location_list.dart';

class LocationListRestRepository extends LocationListBaseRepository {
  @override
  Future<List<LocationListDto>> fetchLocationList(int page) {
    // TODO: implement fetchLocationList
    throw UnimplementedError();
  }

  @override
  Future<LocationListModel> getLocationItem(String url) {
    // TODO: implement getLocationItem
    throw UnimplementedError();
  }
}
