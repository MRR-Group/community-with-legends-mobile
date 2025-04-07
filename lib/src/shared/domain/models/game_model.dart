class Game {
  final int id;
  final String name;

  Game({
    required this.id,
    required this.name,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      name: json['name'],
    );
  }
}
