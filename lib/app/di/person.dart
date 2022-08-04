import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/person/query/handler/contract/multiple_person_list_contract.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/person/query/handler/multiple_person_list.dart';

import '../core/common/eventbus/contract/eventbus_contract.dart';
import '../core/entities/person/query/dispatcher/dispatcher.dart';
import '../core/entities/person/query/handler/contract/detail_contract.dart';
import '../core/entities/person/query/handler/contract/list_contract.dart';
import '../core/entities/person/query/handler/detail.dart';
import '../core/entities/person/query/handler/list.dart';
import '../core/entities/person/repository/base_repository.dart';
import '../viewmodel/person/contract/detail_contract.dart';
import '../viewmodel/person/contract/list_contract.dart';
import '../viewmodel/person/detail.dart';
import '../viewmodel/person/list.dart';

class DiPerson {
  Injector init(Injector injector) {
    injector.map<PersonListQueryHandlerContract>((i) => PersonListQueryHandler(i.get<PersonListBaseRepository>()));
    injector.map<PersonDetailQueryHandlerContract>((i) => PersonDetailQueryHandler(i.get<PersonDetailBaseRepository>()));
    injector
        .map<MultiplePersonFetchListQueryHandlerContract>((i) => MultiplePersonFetchListQueryHandler(i.get<PersonListBaseRepository>()));
    injector.map<PersonQueryDispatcher>(
      (i) => PersonQueryDispatcher(
        detailHandler: i.get<PersonDetailQueryHandlerContract>(),
        listHandler: i.get<PersonListQueryHandlerContract>(),
        filteredListHandler: i.get<MultiplePersonFetchListQueryHandlerContract>(),
      ),
    );
    injector.map<PersonListViewModelContract>(
      (i) => PersonListViewModel(
        i.get<PersonQueryDispatcher>(),
        i.get<EventBusContract>(),
      ),
    );
    injector.map<PersonDetailViewModelContract>(
      (i) => PersonDetailViewModel(
        i.get<PersonQueryDispatcher>(),
        i.get<EventBusContract>(),
      ),
    );
    return injector;
  }
}
