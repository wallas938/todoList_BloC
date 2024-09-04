/*
*
* ISAR TODO MODEL
*
* Converts Todo model into isar model that we can store in our isar database
*
* */

import 'package:isar/isar.dart';
import 'package:todoList_BloC/domain/model/todo.dart';

// to generate isar todo object, run: dart run build_runner build
part 'isar_todo.g.dart';

@Collection()
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  Todo toDomain() {
    return Todo(id: id, text: text, isCompleted: isCompleted);
  }

  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
