import 'package:b_grids/columns/columns.dart';
import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:b_grids/grid/b_grid.dart';
import 'package:example/home/helpers/room_generator.dart';
import 'package:example/models/room.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    generateRooms(1000000).then(
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
    final stateManager = BGridStateManager<Room>(
      columns: [
        const BTextColumn(field: "name"),
        const BTextColumn(field: "description"),
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
        BTextColumn(
            field: "constructionDate",
            renderer: (renderContext) {
              final date = renderContext.value as DateTime?;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  date != null ? DateFormat('yyyy-MM-dd').format(date) : '',
                ),
              );
            }),
        BTextColumn(
            field: "isFurnished",
            defaultValue: false,
            renderer: (renderContext) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: renderContext.value as bool
                    ? const Icon(
                        Icons.check,
                        color: Colors.greenAccent,
                      )
                    : const Icon(
                        Icons.close,
                        color: Colors.redAccent,
                      ),
              );
            }),
      ],
      itemToRow: {
        'name': (room) => room.name,
        'description': (room) => room.description,
        'surfaceArea': (room) => room.surfaceArea,
        'constructionDate': (room) => room.constructionDate,
        'isFurnished': (room) => room.isFurnished,
      },
      valueProvider: () => items,
    );
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
