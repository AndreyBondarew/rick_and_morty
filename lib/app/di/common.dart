import 'package:flutter_simple_dependency_injection/injector.dart';

import '../core/common/eventbus/contract/eventbus_contract.dart';
import '../core/common/eventbus/eventbus.dart';

class DiCommonModule {
  Injector init(Injector injector) {
    injector.map<EventBusContract>((i) => EventBus(), isSingleton: true);

    return injector;
  }
}
