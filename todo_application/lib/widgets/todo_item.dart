import 'package:flutter/material.dart';
import 'package:todo_application/models/todo.dart' show Todo;

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function ondelete;
  final Function onclick;

  const TodoItem({
    super.key,
    required this.todo,
    required this.ondelete,
    required this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),

        child: ListTile(
          onTap: () {
            onclick();
          },
          leading: Icon(
            todo.isDone
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            color: Colors.white,
          ),
          title: Text(
            todo.title.toString(),
            style: TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            onPressed: () {
              ondelete();
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
