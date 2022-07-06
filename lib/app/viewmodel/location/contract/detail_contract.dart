abstract class LocationDetailViewModelContract {
  Future<void> load(int id);
  Stream<LocationDetailNotification> get notifier;
  void dispose();
}

class LocationDetailNotification {}
