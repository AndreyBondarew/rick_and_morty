import '../../../core/common/model/location_list.dart';

abstract class LocationListViewModelContract {
  Future<void> load();
  Stream<LocationListNotifier> get notifier;
  void dispose();
}

class LocationListNotifier {}

class LocationSuccessLoadNotifier implements LocationListNotifier {
  final List<LocationListModel> locations;

  LocationSuccessLoadNotifier(this.locations);
}

class LocationListStartLoadingNotifier implements LocationListNotifier {}
