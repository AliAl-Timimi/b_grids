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
}
