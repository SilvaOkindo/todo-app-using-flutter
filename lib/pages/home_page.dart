import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/todo_db.dart';
import 'package:todo_app/pages/utils/dialog_box.dart';
import 'package:todo_app/pages/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive

  final _mybox = Hive.box("mybox");

  @override
  void initState() {
    // loa initial data
    if (_mybox.get("TODOLIST") == null) {
      todoDB.createInitialData();
    } else {
      todoDB.loadData();
    }

    super.initState();
  }

  // text input controller
  final _controller = TextEditingController();

  // todo list
  TodoDB todoDB = TodoDB();


  void onTaskCompleted(bool? value, int index) {
    setState(() {
      todoDB.todoList[index][1] = !todoDB.todoList[index][1];
    });
    todoDB.updateData();
    //save new task
  }
    void saveNewTask() {
      setState(() {
        todoDB.todoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      todoDB.updateData();
    }

    //create new task
    void createNewTask() {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              controller: _controller,
              onCancel: () => Navigator.of(context).pop(),
              onSave: saveNewTask,
            );
          }
      );
    }
    // delete task

    void deleteTask(int index) {
      setState(() {
        todoDB.todoList.removeAt(index);
      });
      todoDB.updateData();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text(
            "Todo",
          ),
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: todoDB.todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: todoDB.todoList[index][0],
                taskIsCompleted: todoDB.todoList[index][1],
                onChanged: (value) => onTaskCompleted(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }
        ),
        floatingActionButton: FloatingActionButton(onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
      );
    }
}
