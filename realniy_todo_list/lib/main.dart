import 'package:flutter/material.dart';
import 'package:realniy_todo_list/pages/todolist.dart';

import 'addItem.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const ToDoList(),
      routes: {
        '/AddItem':(context) => AddItem(),
        '/ToDoList':(context) => ToDoList(),
      },
    );
  }
}

