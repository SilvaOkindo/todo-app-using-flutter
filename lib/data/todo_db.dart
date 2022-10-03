import 'package:hive/hive.dart';

class TodoDB {
  List todoList = [];

  // reference the box
final _mybox = Hive.box("mybox");

//
  void createInitialData() {
    todoList = [
      ["Make tutorial", false],
      ["Do Exercise", false]
    ];
  }

  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  void updateData() {
    _mybox.put("TODOLIST", todoList);
  }
}