import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/repository/base_repository.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/location/repository/base_repository.dart';
import 'package:rick_and_morty_test_restapi/app/infrastructure/repository/web_restapi/episode/detail.dart';
import 'package:rick_and_morty_test_restapi/app/infrastructure/repository/web_restapi/location/detail.dart';

import '../core/entities/person/repository/base_repository.dart';
import '../infrastructure/repository/web_restapi/person/detail.dart';

class DiDetailRepositories {
  Injector init(Injector injector) {
    injector.map<PersonDetailBaseRepository>((i) => PersonDetailRestRepository(), isSingleton: true);
    injector.map<LocationDetailBaseRepository>((i) => LocationDetailRestRepository(), isSingleton: true);
    injector.map<EpisodeDetailBaseRepository>((i) => EpisodeDetailRestRepository(), isSingleton: true);
    return injector;
  }
}
