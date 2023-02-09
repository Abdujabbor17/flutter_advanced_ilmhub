import 'package:flutter/cupertino.dart';


import '../models/foodModel.dart';

Widget foodItem(BuildContext context, FoodModel food) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(food.name),
        SizedBox(
          width: 20,
        ),
        Text("${food.cost} so'm"),
      ],
    ),
  );
}
