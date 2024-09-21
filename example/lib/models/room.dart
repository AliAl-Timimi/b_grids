class Room {
  final String name;
  final String description;
  final int surfaceArea;
  final DateTime constructionDate;
  final bool isFurnished;
  final double price;

  const Room({
    required this.name,
    required this.description,
    required this.surfaceArea,
    required this.constructionDate,
    required this.isFurnished,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Room &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          surfaceArea == other.surfaceArea &&
          constructionDate == other.constructionDate &&
          isFurnished == other.isFurnished &&
          price == other.price;

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      surfaceArea.hashCode ^
      constructionDate.hashCode ^
      isFurnished.hashCode ^
      price.hashCode;
}
