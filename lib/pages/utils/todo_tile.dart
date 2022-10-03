import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {

  final String taskName;
  final bool taskIsCompleted;
  Function (bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

TodoTile({
  Key? key,
  required this.taskName,
  required this.taskIsCompleted,
  required this.deleteFunction,
  required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(right: 25, top: 25, left: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade200,
              borderRadius: BorderRadius.circular(12),
            )
          ],

        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskIsCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
              // checkbox
              Checkbox(value: taskIsCompleted, onChanged: onChanged, activeColor: Colors.black),
            ],
          ),

        ),
      ),
    );
  }
}