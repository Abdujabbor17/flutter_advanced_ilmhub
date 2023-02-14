import 'package:flutter/material.dart';
import 'package:hive_17/models/todoListModel.dart';
import 'package:hive_17/pages/addPage.dart';
import 'package:hive_17/pages/home_page.dart';
import 'package:hive_17/pages/todolist.dart';
import 'package:hive_17/storage/storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoListModelAdapter());

  box = await Hive.openBox('todolist');
  user = await Hive.openBox('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  const ToDoList(),
      routes: {
        '/AddItem':(context) => const AddItem(),
        '/ToDoList':(context) => const ToDoList(),
      },
    );
  }
}

