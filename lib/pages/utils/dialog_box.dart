import 'package:flutter/material.dart';
import 'package:todo_app/pages/utils/my_button.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({Key? key, required this.controller, required this.onSave, required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task"
              ),
            ),

            // button save and cancel

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(name: "save", onPressed: onSave,),

                const SizedBox(width: 8,),

                // cancel button
                MyButton(name: "Cancel", onPressed: onCancel)
              ],
            )
          ],

        ),
      ),
    );
  }
}
