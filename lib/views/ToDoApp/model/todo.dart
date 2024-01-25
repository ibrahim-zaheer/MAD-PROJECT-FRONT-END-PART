class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(
          id: '01',
          todoText: 'Will Become the Member of investofy',
          isDone: true),
      ToDo(id: '02', todoText: 'Build some projects', isDone: true),
      ToDo(
        id: '03',
        todoText: 'Check Emails',
      ),
      ToDo(
        id: '04',
        todoText: 'Make a presentation',
      ),
      ToDo(
        id: '05',
        todoText: 'Call the Investors',
      ),
      ToDo(
        id: '06',
        todoText: 'Earn Honestly',
      ),
    ];
  }
}
