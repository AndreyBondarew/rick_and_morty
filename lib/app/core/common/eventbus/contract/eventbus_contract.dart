abstract class EventBusContract {
  void dispatch(Event event);

  void addListener(EventBusListener listener);

  void removeListener(EventBusListener listener);
}

abstract class EventBusListener {
  void handle(Event event);
}

class Event {
  const Event();
}
