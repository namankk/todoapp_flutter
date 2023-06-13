import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_home_provider.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoHomeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("TODO LIST"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Add a new todo item here"),
                  controller: provider.textEditingController,
                ),
                ElevatedButton(
                    onPressed: () {
                      provider.insertAtZeroElement();
                    },
                    child: Text("Add to todo List"))
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(provider.todoListUnchecked[index].data),
                      Checkbox(
                          value: provider.todoListUnchecked[index].isChecked,
                          onChanged: (value) {
                            provider.onUncheckedListTap(index, value!);
                          })
                    ],
                  );
                }, childCount: provider.todoListUnchecked.length)),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(provider.todoListChecked[index].data),
                      Checkbox(
                          value: provider.todoListChecked[index].isChecked,
                          onChanged: (value) {
                            provider.onCheckedListTap(index, value!);
                          })
                    ],
                  );
                }, childCount: provider.todoListChecked.length)),
              ],
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
