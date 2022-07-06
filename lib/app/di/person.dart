import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rik_and_morti_rest/app/core/common/eventbus/contract/eventbus_contract.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/dispatcher/dispatcher.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/handler/contract/detail_contract.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/handler/contract/list_contract.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/handler/detail.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/query/handler/list.dart';
import 'package:rik_and_morti_rest/app/core/entities/person/repository/base_repository.dart';
import 'package:rik_and_morti_rest/app/infrastructure/repository/web_restapi/person_repository.dart';
import 'package:rik_and_morti_rest/app/viewmodel/person/contract/list_contract.dart';

import '../viewmodel/person/list.dart';

class DiPerson {
  Injector init(Injector injector) {
    injector.map<PersonBaseRepository>((i) => PersonRestRepository(), isSingleton: true);
    injector.map<PersonListQueryHandlerContract>((i) => PersonListQueryHandler(i.get<PersonBaseRepository>()));
    injector.map<PersonDetailQueryHandlerContract>((i) => PersonDetailQueryHandler(i.get<PersonBaseRepository>()));
    injector.map<PersonQueryDispatcher>(
      (i) => PersonQueryDispatcher(
        detailHandler: i.get<PersonDetailQueryHandlerContract>(),
        listHandler: i.get<PersonListQueryHandlerContract>(),
      ),
    );
    injector.map<PersonListViewModelContract>(
      (i) => PersonListViewModel(
        i.get<PersonQueryDispatcher>(),
        i.get<EventBusContract>(),
      ),
    );
    return injector;
  }
}
