import 'package:b_grids/columns/columns.dart';
import 'package:b_grids/configuration/b_grid_config.dart';
import 'package:b_grids/configuration/b_grid_state_manager.dart';
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
  final stateManager = BGridStateManager<Room>(
    columns: [
      BTextColumn(field: "name"),
      BTextColumn(
        field: "description",
      ),
      BNumberColumn(
        field: "surfaceArea",
        cellDecorationBuilder: (value) {
          return BoxDecoration(
            color: value > 50 ? Colors.red : Colors.green,
          );
        },
        cellTextStyleBuilder: (value) {
          return TextStyle(
            color: value > 50 ? Colors.white : Colors.black,
          );
        },
      ),
      BDateColumn(
        field: "constructionDate",
      ),
      BBoolColumn(
        field: "isFurnished",
        defaultValue: false,
      ),
    ],
    itemToRow: (room) => {
      'name': room.name,
      'description': room.description,
      'surfaceArea': room.surfaceArea,
      'constructionDate': room.constructionDate,
      'isFurnished': room.isFurnished,
    },
    valueProvider: () => [],
  );

  Future<void> _refresh() async {
    setState(() {
      loading = true;
    });
    generateRooms(5000).then(
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
    stateManager.valueProvider = () => items;
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
                  stateManager: stateManager,
                  config: BGridConfig(
                    multiSelect: true,
                  ),
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
