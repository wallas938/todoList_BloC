/*
*
* TODO PAGE : Responsible for providing cubit to view (UI)
*  
* - use BlocProvider
* 
* */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoList_BloC/domain/repository/todo_repository.dart';
import 'package:todoList_BloC/presentation/todo_cubit.dart';
import 'package:todoList_BloC/presentation/todo_view.dart';

class TodoPage extends StatelessWidget {
  
  final TodoRepository todoRepository;
  
  const TodoPage({super.key, required this.todoRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TodoCubit(todoRepository), child: const TodoView(),);
  }
}
