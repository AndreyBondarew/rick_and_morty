import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/di/location.dart';
import 'package:rick_and_morty_test_restapi/app/di/person.dart';
import 'package:rick_and_morty_test_restapi/app/di/repository_detail.dart';
import 'package:rick_and_morty_test_restapi/app/di/repository_list.dart';

import 'common.dart';
import 'episode.dart';

class Di {
  void init() {
    final Injector injector = Injector();
    DiCommonModule().init(injector);
    DiListRepositories().init(injector);
    DiDetailRepositories().init(injector);
    DiPerson().init(injector);
    DiLocation().init(injector);
    DiEpisode().init(injector);
  }
}
