class GenerationInfo {
  final String generation;
  final String region;
  final List<dynamic> games;
  final String firstGames;

  GenerationInfo({
    required this.generation,
    required this.region,
    required this.games,
    required this.firstGames,
  });

  factory GenerationInfo.empty(List<dynamic> games) {
    return GenerationInfo(
      generation: "Unknown",
      region: "Unknown",
      games: games,
      firstGames: "Unknown",
    );
  }
}