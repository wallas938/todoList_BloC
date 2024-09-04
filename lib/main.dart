import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoList_BloC/data/models/isar_todo.dart';
import 'package:todoList_BloC/data/repository/isar_todo_repository.dart';
import 'package:todoList_BloC/domain/repository/todo_repository.dart';
import 'package:todoList_BloC/presentation/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get directory path for storing data
  final dir = await getApplicationDocumentsDirectory();

// open isar database
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

// initialize the repo with isar database
  final isarTodoRepo = IsarTodoRepository(isar);

// run app
  runApp(MyApp(todoRepository: isarTodoRepo));
}

class MyApp extends StatelessWidget {
  // database injection through the app
  final TodoRepository todoRepository;

  const MyApp({super.key, required this.todoRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepository: todoRepository),
    );
  }
}
