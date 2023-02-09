import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/items/historyItem.dart';

import '../states.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History',

      ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            historyItem(context,  'choy', box.read('choy')),
            historyItem(context,  'non', box.read('non')),
            historyItem(context,  'ovqat', box.read('ovqat')),
            historyItem(context,  'salat', box.read('salat')),
            historyItem(context,  'ichimlik', box.read('ichimlik')),
          ],
        ),
      ),
    );
  }
}
