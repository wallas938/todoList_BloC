/*
*
* TODO REPOSITORY
*
* Here is defined what the app can do
*
* */

import 'package:todoList_BloC/domain/model/todo.dart';

abstract class TodoRepository {

  // GET LIST OF TODO
  Future<List<Todo>> getTodos();

  // ADD A NEW TODO
  Future<void> addTodo(Todo todo);

  // UPDATE AN EXISTING TODO
  Future<void> updateTodo(Todo todo);

  // DELETE A TODO
  Future<void> deleteTodo(Todo todo);

}