import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List View'),
      ),
      body: ListView.builder(
        itemExtent: 72,
        controller: _scrollController,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Scroll to the 4th item in the list
          _scrollController.animateTo(
            50 * 72.0, // height of one item in the list
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(Icons.arrow_downward),
      ),
    );
  }
}
