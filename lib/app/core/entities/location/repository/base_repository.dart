import 'package:rick_and_morty_test_restapi/app/core/common/model/dto/location_list_dto.dart';

import '../../../common/base/base_repository.dart';
import '../../../common/model/location_detail.dart';
//import '../../../common/model/location_list.dart';

abstract class LocationListBaseRepository implements BaseRepository {
  Future<LocationListDto> fetchLocationList(int page);
  //Future<LocationListModel> getLocationItem(String url);
}

abstract class LocationDetailBaseRepository implements BaseRepository {
  Future<LocationDetailModel> getLocationFromId(int id);
  //Future<LocationDetailModel> getLocationFromUrl(String url);
}
