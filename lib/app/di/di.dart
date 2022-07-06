import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rik_and_morti_rest/app/di/common.dart';
import 'package:rik_and_morti_rest/app/di/person.dart';

class Di {
  void init() {
    final Injector injector = Injector();
    DiCommonModule().init(injector);
    DiPerson().init(injector);
  }
}
