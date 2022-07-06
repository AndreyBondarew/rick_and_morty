import '../../../common/base/base_repository.dart';
import '../../../common/model/location_detail.dart';
import '../../../common/model/location_list.dart';

abstract class LocationBaseRepository implements BaseRepository {
  Future<List<LocationListModel>> fetchLocationList([int? page]);

  Future<LocationDetailModel> getLocation(int id);
}
