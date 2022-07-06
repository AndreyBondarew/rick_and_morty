abstract class LocationListViewModelContract {
  Future<void> load();
  Stream<LocationNotification> get notifier;
  void dispose();
}

class LocationNotification {}
