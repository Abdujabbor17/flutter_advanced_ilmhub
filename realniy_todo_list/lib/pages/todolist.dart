
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../editItem.dart';
import '../itemOfTodoList.dart';
import '../models/todoListModel.dart';
import '../service/pref_service_list.dart';
import '../states.dart';


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
        child: FutureBuilder(
          future: PrefsList.readListString(),
          builder: (context,snapshot) {
            if(snapshot.hasData){
              List<TodoListModel> notes = convertToModel(snapshot.data);
              return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context,index){
                    return itemOfTodoList(
                        context,
                        notes[index],
                            (){
                              notes.removeAt(index);
                          Navigator.pop(context);
                          setState(() {});
                        }, //delete button
                            (){
                          // Navigator.pop(context);
                          //   Navigator.push(context,
                          //       MaterialPageRoute(
                          //           builder: (context) => EditItem(
                          //           title: list[index]['title']!,
                          //           text: list[index]['text']!,
                          //           index: index)
                          //       )
                          //   );
                        }
                    );
                  });
            }else{
              return Center(child: Text(snapshot.error.toString()));
            }

          }
        ),
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

List<TodoListModel> convertToModel(List<String> listString){
  List<TodoListModel> list = [];
  listString.forEach((element){
    Map<String,dynamic> map = jsonDecode(element);
    var note = TodoListModel.fromJson(map);
    list.add(note);
  });

  return list;

}
