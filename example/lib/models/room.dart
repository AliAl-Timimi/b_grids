class Room {
  final String name;
  final String description;
  final int surfaceArea;

  const Room({
    required this.name,
    required this.description,
    required this.surfaceArea,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      name: json['name'],
      description: json['description'],
      surfaceArea: json['surfaceArea'],
    );
  }
}
