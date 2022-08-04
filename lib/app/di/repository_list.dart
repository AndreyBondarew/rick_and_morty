import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/repository/base_repository.dart';
import 'package:rick_and_morty_test_restapi/app/infrastructure/repository/web_restapi/episode/list.dart';
import 'package:rick_and_morty_test_restapi/app/infrastructure/repository/web_restapi/location/list.dart';

import '../core/entities/location/repository/base_repository.dart';
import '../core/entities/person/repository/base_repository.dart';
import '../infrastructure/repository/web_restapi/person/list.dart';

class DiListRepositories {
  Injector init(Injector injector) {
    injector.map<PersonListBaseRepository>((i) => PersonListRestRepository(), isSingleton: true);
    injector.map<LocationListBaseRepository>((i) => LocationListRestRepository(), isSingleton: true);
    injector.map<EpisodeListBaseRepository>((i) => EpisodeListRestRepository(), isSingleton: true);
    return injector;
  }
}
