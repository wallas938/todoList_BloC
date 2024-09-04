/*
*
* TODO VIEW: Responsible for UI
*
* - use BlocBuilder
*
* */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoList_BloC/domain/model/todo.dart';
import 'package:todoList_BloC/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  // show dialog box for user to type
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: textController),
        actions: [
          // cancel button
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ), // TextButton

          // add button
          TextButton(
            onPressed: () {
              todoCubit.addTodo(textController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ), // TextButton
        ],
      ), // AlertDialog
    );
  }


  @override
  Widget build(BuildContext context) {

    // todo cubit
    final todoCubit = context.read<TodoCubit>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => _showAddTodoBox(context)),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          // List View
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              // get individual todo from todos list
              final todo = todos[index];

              // List Tile UI
              return ListTile(
                // text
                title: Text(todo.text),

                // check box
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) => todoCubit.toggleTodoCompletion(todo),
                ), // Checkbox

                // delete button
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => todoCubit.deleteTodo(todo),
                ), // IconButton
              ); // ListTile
            },
          ); // ListView.builder

        },
      )
    );
  }
}
