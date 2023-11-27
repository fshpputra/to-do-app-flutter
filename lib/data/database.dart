import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  late Box<List<dynamic>> _myBox; // Tentukan tipe Hive box.

  // Konstruktor untuk membuka Hive box.
  ToDoDatabase() {
    openHiveBox();
  }

  // Inisialisasi Hive dan buka kotak.
  Future<void> openHiveBox() async {
    await Hive.initFlutter();
    _myBox = await Hive.openBox<List<dynamic>>('mybox');
  }

  // run this method if this is the 1st time opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST", defaultValue: []) ?? [];
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}



