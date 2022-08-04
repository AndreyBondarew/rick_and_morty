import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/eventbus/contract/eventbus_contract.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/location/query/dispatcher/dispatcher.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/location/query/handler/contract/detail_contract.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/location/query/handler/contract/list_contract.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/location/query/handler/detail.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/location/query/handler/list.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/location/repository/base_repository.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/location/contract/detail_contract.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/location/contract/list_contract.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/location/detail.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/location/list.dart';

class DiLocation {
  Injector init(Injector injector) {
    injector.map<LocationListQueryHandlerContract>(
      (i) => LocationListQueryHandler(
        i.get<LocationListBaseRepository>(),
      ),
    );
    injector.map<LocationDetailQueryHandlerContract>(
      (i) => LocationDetailQueryHandler(
        i.get<LocationDetailBaseRepository>(),
      ),
    );
    injector.map<LocationQueryDispatcher>(
      (i) => LocationQueryDispatcher(
        listHandler: i.get<LocationListQueryHandlerContract>(),
        detailHandler: i.get<LocationDetailQueryHandlerContract>(),
      ),
    );
    injector.map<LocationListViewModelContract>(
      (i) => LocationListViewModel(
        i.get<LocationQueryDispatcher>(),
        i.get<EventBusContract>(),
      ),
    );
    injector.map<LocationDetailViewModelContract>((i) => LocationDetailViewModel(
          i.get<LocationQueryDispatcher>(),
          i.get<EventBusContract>(),
        ));
    return injector;
  }
}
