class Hardware {
  final int? id;
  final String title;
  final String value;

  Hardware({
    this.id,
    required this.title,
    required this.value,
  });

  factory Hardware.fromJson(Map<String, dynamic> json) {
    return Hardware(
      id: json['id'],
      title: json['title'],
      value: json['value'],
    );
  }

}
