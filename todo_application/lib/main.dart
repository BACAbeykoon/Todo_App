import 'package:flutter/material.dart';
import 'package:todo_application/Widgets/todo_item.dart';
import 'package:todo_application/models/todo.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyToDo()));
}

class MyToDo extends StatefulWidget {
  const MyToDo({super.key});

  @override
  State<MyToDo> createState() => _MyToDoState();
}

class _MyToDoState extends State<MyToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 234, 234),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu),
            Text("ToDo App", style: TextStyle(fontWeight: FontWeight.bold)),
            CircleAvatar(backgroundImage: AssetImage("assets/user.png")),
          ],
        ),
      ),
      body: _body(),
    );
  }
}

_body() {
  return Stack(
    children: [
      Column(
        children: [
          _searchBar(),

          _toDos(),
          //_inputTodo()
        ],
      ),
    ],
  );
}

_searchBar() {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
        ),
      ),
    ),
  );
}

_toDos() {
  return TodoItem(todo: Todo(id: "1", title: "Gym"));
}

_inputTodo() {
  return Placeholder();
}
