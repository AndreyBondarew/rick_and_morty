import '../../../core/common/model/location_list.dart';

abstract class LocationListViewModelContract {
  Future<void> load();
  Stream<LocationListNotifier> get notifier;
  void dispose();
}

class LocationListNotifier {}

class LocationListSuccessLoadNotifier implements LocationListNotifier {
  final List<LocationListModel> locations;

  LocationListSuccessLoadNotifier(this.locations);
}

class LocationListStartLoadingNotifier implements LocationListNotifier {}

class LocationListNothingLoadingNotifier implements LocationListNotifier {}

class LocationListErrorLoadingNotifier implements LocationListNotifier {
  final String? message;

  LocationListErrorLoadingNotifier([this.message]);
}
