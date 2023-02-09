import 'package:flutter/cupertino.dart';


import '../models/foodModel.dart';

Widget historyItem(BuildContext context, String name, String count) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        SizedBox(
          width: 20,
        ),
        Text("${count}"),
      ],
    ),
  );
}
