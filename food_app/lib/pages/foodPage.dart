import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/items/foodItem.dart';
import 'package:food_app/states.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Taomlar"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(itemCount:foodList.length,
        itemBuilder: (context, index) {
          return foodItem(context, foodList[index]);
        }),
      ),
    );
  }
}
