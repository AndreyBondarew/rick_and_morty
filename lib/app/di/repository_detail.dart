import 'package:flutter_simple_dependency_injection/injector.dart';

import '../core/entities/person/repository/base_repository.dart';
import '../infrastructure/repository/web_restapi/person/detail.dart';

class DiDetailRepositories {
  Injector init(Injector injector) {
    injector.map<PersonDetailBaseRepository>((i) => PersonDetailRestRepository(), isSingleton: true);
    return injector;
  }
}
