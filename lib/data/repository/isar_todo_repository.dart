/*
*
* Database Repository
*
* This implements the Todo repository and handles storing, retrieving, updating and deleting
* in the isar database.
*
* */

import 'package:isar/isar.dart';
import 'package:todoList_BloC/data/models/isar_todo.dart';
import 'package:todoList_BloC/domain/model/todo.dart';
import 'package:todoList_BloC/domain/repository/todo_repository.dart';

class IsarTodoRepository implements TodoRepository {
  // DATABASE
  final Isar db;

  IsarTodoRepository(this.db);

  @override
  Future<List<Todo>> getTodos() async {
    // Fetch from database
    final isarTodos = await db.todoIsars.where().findAll();

    return isarTodos.map((isarTodos) => isarTodos.toDomain()).toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    // Convert TODO into IsarTodo
    final isarTodo = TodoIsar.fromDomain(todo);

    // so that we can store it in our isar db
    db.writeTxn(() => db.todoIsars.put(isarTodo));
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    // Convert the updatedTodo into IsarTodo
    final isarTodo = TodoIsar.fromDomain(todo);

    // so that we can store it in our isar db
    await db.writeTxn(() => db.todoIsars.put(isarTodo));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {

    await db.todoIsars.where().idEqualTo(todo.id).deleteFirst();

    // await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}
