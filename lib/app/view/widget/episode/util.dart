class SeasonEpisodeDTO {
  final String season;
  final String episode;

  SeasonEpisodeDTO(this.season, this.episode);

  factory SeasonEpisodeDTO.fromString(String data) {
    return SeasonEpisodeDTO(
      data.substring(1, data.indexOf('E')),
      data.substring(data.indexOf('E') + 1),
    );
  }

  @override
  String toString() {
    return 'Season: $season, episode: $episode';
  }
}
