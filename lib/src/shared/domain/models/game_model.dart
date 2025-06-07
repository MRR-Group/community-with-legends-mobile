class Game {
  final int id;
  final String name;
  final String cover;

  Game({
    required this.id,
    required this.name,
    required this.cover,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      name: json['name'],
      cover: json['cover'],
    );
  }
}
