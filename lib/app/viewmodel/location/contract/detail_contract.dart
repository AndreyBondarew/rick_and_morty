import 'package:rick_and_morty_test_restapi/app/core/common/model/location_detail.dart';

abstract class LocationDetailViewModelContract {
  Future<void> load(int id);
  Stream<LocationDetailNotification> get notifier;
  void dispose();
}

class LocationDetailNotification {}

class LocationDetailSuccessLoadNotification implements LocationDetailNotification {
  final LocationDetailModel data;

  LocationDetailSuccessLoadNotification(this.data);
}
