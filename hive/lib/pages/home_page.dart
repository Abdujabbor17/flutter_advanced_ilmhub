import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../storage/storage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hive Example'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter smth',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (){
                  user!.put('name', controller.text);
                  setState(() {});
                },
                child: const Text('Save')),

            const SizedBox(height: 30,),
            Text(user!.get('name') ?? 'No text')
          ],
        ),
      ),
    );
  }
}
