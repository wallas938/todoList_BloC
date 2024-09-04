/*
*
* TODO CUBIT - simple state management
*
* Each cubit is a list of todos
* */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoList_BloC/domain/model/todo.dart';
import 'package:todoList_BloC/domain/repository/todo_repository.dart';

class TodoCubit extends Cubit<List<Todo>> {
  // Reference todo repository
  final TodoRepository todoRepository;

  TodoCubit(this.todoRepository) : super([]);

  // L O A D
  Future<void> loadTodos() async {
    // Fetch list of todos from repository methods
    final todoList = await todoRepository.getTodos();

    //emit the fetched list as the new state
    emit(todoList);
  }

// A D D

  Future<void> addTodo(String text) async {
    // Create a new todo with unique ID
    final newTodo = Todo(id: DateTime.now().millisecondsSinceEpoch, text: text);

    // Save the new todo to repository
    await todoRepository.addTodo(newTodo);

    //Re-loading
    loadTodos();
  }

  // D E L E T E

  Future<void> deleteTodo(Todo todo) async {
    // Delete the provided todo from repository
    await todoRepository.deleteTodo(todo);

    //Re-load
    loadTodos();
  }

  // T O G G L E
  Future<void> toggleTodoCompletion(Todo todo) async {
    // Toggle todo completion status
    Todo updatedTodo = todo.toggleCompletion();

    // Update the todo in the repository with new completion status
    await todoRepository.updateTodo(updatedTodo);

    // Re-load
    loadTodos();
  }
}
