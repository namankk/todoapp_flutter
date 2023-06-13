import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/feature/todo_app_main_feature/presenter/pages/todo_home_page.dart';
import 'package:todoapp/feature/todo_app_main_feature/presenter/provider/todo_home_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create: (BuildContext context) => TodoHomeProvider(),
          child: TodoHomePage()),
    );
  }
}
