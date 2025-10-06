class FootballScore {
  final String team1;
  final String team2;
  final int team1_Score;
  final int team2_Score;
  final String winnerTeam;
  final bool isRunning;
  final String matchName;

  FootballScore({
    required this.team1,
    required this.team2,
    required this.team1_Score,
    required this.team2_Score,
    required this.winnerTeam,
    required this.isRunning,
    required this.matchName,
  });

  factory FootballScore.fromJson(Map<String, dynamic> json, String matchName) {
    return FootballScore(
      team1: json['team1'] ?? '',
      team2: json['team2'] ?? '',
      team1_Score: (json['team1_score'] ?? 0) as int,
      team2_Score: (json['team2_score'] ?? 0) as int,
      winnerTeam: json['winner_team'] ?? '',
      isRunning: (json['is_running'] ?? false) as bool,
      matchName: matchName,
    );
  }
}

