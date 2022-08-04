import 'package:rick_and_morty_test_restapi/app/core/common/model/location_detail.dart';

abstract class LocationDetailViewModelContract {
  Future<void> load(int id);
  Stream<LocationDetailNotifier> get notifier;
  void dispose();
}

class LocationDetailNotifier {}

class LocationDetailSuccessLoadNotifier implements LocationDetailNotifier {
  final LocationDetailModel data;

  LocationDetailSuccessLoadNotifier(this.data);
}

class LocationDetailLoadingErrorNotifier implements LocationDetailNotifier {
  final String? message;

  LocationDetailLoadingErrorNotifier([this.message]);
}
