import '../episode_list.dart';

class EpisodeListDto {
  final List<EpisodeListModel> episodes;
  final int totalPages;
  final int currentPage;

  EpisodeListDto({
    required this.episodes,
    required this.totalPages,
    required this.currentPage,
  });
}
