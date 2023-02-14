import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/todoListModel.dart';
import '../storage/storage.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  var titleCtr = TextEditingController();
  var textCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Item'),),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: titleCtr,
                decoration: const InputDecoration(
                  hintText: 'Enter title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 16,),
            const Text('Your text',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54
              ),
            ),
            const SizedBox(height: 10,),
             TextFormField(
               controller: textCtr,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your text',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
            const SizedBox(height: 16,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text('Back')),
                ElevatedButton(
                    onPressed: () async {
                      var hour = DateTime.now().hour;
                      var minute = DateTime.now().minute;
                      String currentTime = '$hour:$minute';
                      var newNote = TodoListModel(
                          title: titleCtr.text,
                          note: textCtr.text,
                          currentTime: currentTime);

                      box!.add(newNote);

                     setState(() {});
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/ToDoList',
                              (Route<dynamic> route) => false);

                    },
                    child: const Text('Save'))

              ],
            )
          ],
        ),
      )
    );
  }
}
