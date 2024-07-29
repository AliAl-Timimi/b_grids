import 'package:example/models/room.dart';
import 'package:faker/faker.dart';

final Faker faker = Faker();

Room _generateRoom(int index) {
  return Room(
    name: faker.person.name(),
    description: 'This is a room $index',
    surfaceArea: faker.randomGenerator.integer(100, min: 10),
    constructionDate: faker.date.dateTime(minYear: 2000, maxYear: 2050),
    isFurnished: faker.randomGenerator.boolean(),
    price: faker.randomGenerator.decimal(scale: 1400, min: 100),
  );
}

Future<List<Room>> generateRooms(int count) async {
  return List.generate(count, (index) => _generateRoom(index));
}
