import 'package:flutter/material.dart';
import 'package:weathertime/utilities/screens/Colors/colors.dart';

import '../model/todoModel.dart';

class ToDoItems extends StatelessWidget {
  final ToDo todo;
  final onToDoChange;
  final onDelete;

  const ToDoItems(
      {super.key,
      required this.todo,
      required this.onToDoChange,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    bool check = false;
    void icons() {}

    return Container(
      margin: EdgeInsets.only(bottom: 18.76),
      child: ListTile(
        onTap: () {
          onToDoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: AppColors.AppTileColor,
        leading: IconButton(
          onPressed: () {},
          color: AppColors.AppWhite,
          icon: Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank),
        ),
        title: Text(
          todo.ToDoText!,
          style: TextStyle(
              fontSize: 20,
              color: AppColors.AppWhite,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_rounded),
          color: AppColors.AppRed,
          onPressed: () {
            onDelete(todo.id);
          },
        ),
      ),
    );
  }
}
