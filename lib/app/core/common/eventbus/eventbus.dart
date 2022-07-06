import 'contract/eventbus_contract.dart';

class EventBus implements EventBusContract {
  final List<EventBusListener> _listeners = [];

  @override
  void addListener(EventBusListener listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(EventBusListener listener) {
    _listeners.remove(listener);
  }

  @override
  void dispatch(Event event) {
    for (var element in _listeners) {
      element.handle(event);
    }
  }
}
