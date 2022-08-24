import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';

import '../../../core/common/model/episode_list.dart';

abstract class EpisodeListViewModelContract {
  Future<void> load({BaseFilter? filter});
  void dispose();
  Stream<EpisodeListNotifier> get notifier;
}

class EpisodeListNotifier {}

class EpisodeListSuccessLoadNotifier implements EpisodeListNotifier {
  final List<EpisodeListModel> data;

  EpisodeListSuccessLoadNotifier(this.data);
}

class EpisodeListNowLoadingNotifier implements EpisodeListNotifier {}

class EpisodeListNothingLoadingNotifier implements EpisodeListNotifier {}

class EpisodeListErrorLoadingNotifier implements EpisodeListNotifier {
  final String? message;

  EpisodeListErrorLoadingNotifier([this.message]);
}
