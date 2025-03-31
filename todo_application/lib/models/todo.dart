class Todo {
  String id;
  String title;
  bool isDone;

  Todo({required this.id, required this.title, this.isDone = false});

  void isToggleDone() {
    isDone = !isDone;
  }

  static List<Todo> toDoList() {
    return [
      Todo(id: "1", title: "Buy Book"),
      Todo(id: "2", title: "Go to School"),
      Todo(id: "3", title: "Play Cricket"),
    ];
  }
}
