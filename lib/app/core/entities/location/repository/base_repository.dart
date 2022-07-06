import 'package:rik_and_morti_rest/app/core/common/base/base_repository.dart';
import 'package:rik_and_morti_rest/app/core/common/model/location_list.dart';

import '../../../common/model/location_detail.dart';

abstract class LocationBaseRepository implements BaseRepository {
  Future<List<LocationListModel>> fetchLocationList([int? page]);

  Future<LocationDetailModel> getLocation(int id);
}
