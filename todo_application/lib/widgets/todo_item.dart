import 'package:flutter/material.dart';
import 'package:todo_application/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(221, 13, 13, 13),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
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
            onPressed: () {},
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
