import 'package:rick_and_morty_test_restapi/app/core/common/model/episode_detail.dart';

abstract class EpisodeDetailViewModelContract {
  Future<void> load(int id);
  void dispose();
  Stream<EpisodeDetailNotifier> get notifier;
}

class EpisodeDetailNotifier {}

class EpisodeDetailSuccessLoadingNotifier implements EpisodeDetailNotifier {
  final EpisodeDetailModel episode;

  EpisodeDetailSuccessLoadingNotifier(this.episode);
}

class EpisodeDetailErrorNotifier implements EpisodeDetailNotifier {
  final String? message;

  EpisodeDetailErrorNotifier([this.message]);
}
