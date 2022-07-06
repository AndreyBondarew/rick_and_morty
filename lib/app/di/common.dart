import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rik_and_morti_rest/app/core/common/eventbus/contract/eventbus_contract.dart';
import 'package:rik_and_morti_rest/app/core/common/eventbus/eventbus.dart';

class DiCommonModule {
  Injector init(Injector injector) {
    injector.map<EventBusContract>((i) => EventBus(), isSingleton: true);

    return injector;
  }
}
