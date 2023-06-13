import 'package:flutter/cupertino.dart';

import '../../domain/entities/todo_entity.dart';

class TodoHomeProvider extends ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  List<TodoEntity> todoListUnchecked = [];
  List<TodoEntity> todoListChecked = [];

  void refreshViews() {
    notifyListeners();
  }

  insertAtZeroElement() {
    todoListUnchecked.insert(0, TodoEntity(textEditingController.text, false));
    textEditingController.clear();
    refreshViews();
  }

  onUncheckedListTap(int index, bool value) {
    todoListChecked.add(TodoEntity(todoListUnchecked[index].data, value));
    todoListUnchecked.removeAt(index);
    refreshViews();
  }

  onCheckedListTap(int index, bool value) {
    todoListUnchecked.add(TodoEntity(todoListChecked[index].data, value));
    todoListChecked.removeAt(index);
    refreshViews();
  }
}
