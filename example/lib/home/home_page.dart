import 'package:b_grids/columns/columns.dart';
import 'package:b_grids/grid/b_grid.dart';
import 'package:example/home/helpers/room_generator.dart';
import 'package:example/models/room.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Room> items = [];
  bool loading = false;

  Future<void> _refresh() async {
    setState(() {
      loading = true;
    });
    generateRooms(5000000).then(
      (value) {
        setState(() {
          items = value;
          loading = false;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Rooms"),
                IconButton(
                  onPressed: _refresh,
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BGrid<Room>(
                  itemToRow: {
                    'name': (room) => room.name,
                    'description': (room) => room.description,
                    'surfaceArea': (room) => room.surfaceArea,
                  },
                  columns: [
                    const BTextColumn(field: "name"),
                    const BTextColumn(field: "description"),
                    BNumberColumn(
                      field: "surfaceArea",
                      contentPadding: EdgeInsets.zero,
                      renderer: (value) => Container(
                        color: Colors.grey[300],
                        child: Text(
                          value.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: (value as int) > 50
                                  ? Colors.blue
                                  : Colors.red),
                        ),
                      ),
                    ),
                  ],
                  multiSelect: false,
                  items: items,
                  onSelect: (room) async {
                    print("Selected room: ${room.name}");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
