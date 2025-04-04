import 'package:flutter/material.dart';
import 'package:todo_application/models/todo.dart';
import 'package:todo_application/Widgets/todo_item.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyTodo()));
}

class MyTodo extends StatefulWidget {
  const MyTodo({super.key});

  @override
  State<MyTodo> createState() => _MyTodoState();
}

class _MyTodoState extends State<MyTodo> {
  final todos = Todo.toDoList();
  List<Todo> _searchTodolist = [];
  final TextEditingController _todoController = TextEditingController();

  @override
  initState() {
    super.initState();
    setState(() {
      _searchTodolist = todos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 227, 227),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),

            CircleAvatar(backgroundImage: AssetImage("assets/user.png")),
          ],
        ),
      ),

      body: _body(),
    );
  }

  _body() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_searchbar(), _todos(), _input()],
        ),
      ],
    );
  }

  _searchbar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextField(
            onChanged: (value) => search(value),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              prefix: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  _todos() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("All Todos"),
            Expanded(
              child: ListView(
                children: [
                  for (Todo todo in _searchTodolist.reversed)
                    TodoItem(
                      todo: todo,
                      ondelete: () {
                        setState(() {
                          _searchTodolist.remove(todo);
                        });
                      },
                      onclick: () {
                        setState(() {
                          todo.isDone = !todo.isDone;
                        });
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _input() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add New ToDos",
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    todos.add(
                      Todo(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: _todoController.text,
                      ),
                    );
                  });
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void search(String text) {
    List<Todo> result = [];

    if (text.isEmpty) {
      result = todos;
    } else {
      result =
          todos
              .where(
                (todo) => todo.title.toLowerCase().contains(text.toLowerCase()),
              )
              .toList();
    }
    setState(() {
      _searchTodolist = result;
    });
  }
}
