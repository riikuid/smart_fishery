class Tambak {
  final String id;
  final String name;
  final DateTime createdAt;
  Tambak({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Tambak.fromJson(Map<String, dynamic> json) {
    return Tambak(
      id: json['id'],
      name: json['nama_tambak'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
