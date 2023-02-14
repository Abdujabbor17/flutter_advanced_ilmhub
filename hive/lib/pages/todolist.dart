
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_17/main.dart';

import '../items/itemOfTodoList.dart';
import '../models/todoListModel.dart';
import '../storage/storage.dart';




class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: box!.values.length ?? 0,
            itemBuilder: (context,index){
              return itemOfTodoList(
                  context,
                  box!.getAt(index)!,
                      (){
                    Navigator.pop(context);
                    setState(() {});
                  }, //delete button
                      (){
                  }
              );
            })
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.pushNamed(context, '/AddItem');

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// List<TodoListModel> convertToModel(List<String> listString){
//   List<TodoListModel> list = [];
//   listString.forEach((element){
//     Map<String,dynamic> map = jsonDecode(element);
//     var note = TodoListModel.fromJson(map);
//     list.add(note);
//   });
//
//   return list;
//
// }
