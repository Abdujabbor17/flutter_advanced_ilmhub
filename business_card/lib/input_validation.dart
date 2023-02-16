import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Validation extends StatefulWidget {
  const Validation({super.key});

  @override
  _ValidationState createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  final _formKey = GlobalKey<FormState>();
  bool _isValid = false;
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _isValid ? Colors.green : Colors.grey,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _isValid ? Colors.green : Colors.blue,
                    ),
                  ),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (!value!.contains('@')) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _isValid = _formKey.currentState!.validate();
                  });
                },
              ),
            ),
            Text(
              'What is the capital of France?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                RadioListTile(
                  title: Text('New York'),
                  value: 'New York',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Paris'),
                  value: 'Paris',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('London'),
                  value: 'London',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedOption == 'Paris') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Correct!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Incorrect!')),
                  );
                }
              },
              child: Text('Submit'),
            ),
            SizedBox(
              height: 20,
            ),
            ExpansionTile(
              title: const Text('Expandable List Item'),
              children: [
                ListTile(
                  title: const Text('Child 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Child 2'),
                  onTap: () {},
                ),
                // Add more ListTiles as needed
              ],
            )
          ],
        ),
      ),
    );
  }
}

String? getRandImg() {
  var random = Random();
  var randomNumber = random.nextInt(6) + 1;

  switch (randomNumber) {
    case 1:
      {
        return 'a rasm';
      }
    case 2:
      {
        return 'b rasm';
      }
    case 3:
      {
        return 'c rasm';
      }
    case 4:
      {
        return 'd rasm';
      }
    case 5:
      {
        return 'f rasm';
      }
    case 6:
      {
        return 'l rasm';
      }

      return 'ng rasm';
  }
  return null;
}
