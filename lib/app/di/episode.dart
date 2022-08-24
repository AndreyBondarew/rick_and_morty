import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/eventbus/contract/eventbus_contract.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/dispatcher/dispatcher.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/handler/contract/detail_contract.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/handler/contract/list_contract.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/handler/contract/multiple_episode_list_contact.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/handler/detail.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/handler/list.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/query/handler/multiple_episode_list.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/repository/base_repository.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/episode/contract/detail_contract.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/episode/contract/list_contract.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/episode/detail.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/episode/list.dart';

class DiEpisode {
  Injector init(Injector injector) {
    injector.map<EpisodeListQueryHandlerContract>((i) => EpisodeListQueryHandler(i.get<EpisodeListBaseRepository>()));
    injector.map<EpisodeDetailQueryHandlerContract>((i) => EpisodeDetailQueryHandler(i.get<EpisodeDetailBaseRepository>()));
    injector.map<MultipleEpisodeListQueryHandlerContract>((i) => MultipleEpisodeListQueryHandler(i.get<EpisodeListBaseRepository>()));
    injector.map<EpisodeQueryDispatcher>(
      (i) => EpisodeQueryDispatcher(
        detailHandler: i.get<EpisodeDetailQueryHandlerContract>(),
        listHandler: i.get<EpisodeListQueryHandlerContract>(),
        filteredListHandler: i.get<MultipleEpisodeListQueryHandlerContract>(),
      ),
    );
    injector.map<EpisodeListViewModelContract>((i) => EpisodeListViewModel(i.get<EpisodeQueryDispatcher>(), i.get<EventBusContract>()));

    injector.map<EpisodeDetailViewModelContract>((i) => EpisodeDetailViewModel(i.get<EpisodeQueryDispatcher>(), i.get<EventBusContract>()));
    return injector;
  }
}
