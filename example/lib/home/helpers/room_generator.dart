import 'package:example/models/room.dart';
import 'package:faker/faker.dart';

final Faker faker = Faker();

Room _generateRoom(int index) {
  return Room(
    name: faker.person.name(),
    description: 'This is a room $index',
    surfaceArea: faker.randomGenerator.integer(100, min: 10),
  );
}

Future<List<Room>> generateRooms(int count) async {
  return List.generate(count, (index) => _generateRoom(index));
}
