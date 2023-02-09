import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/states.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var saladCTR = TextEditingController();
  var foodCTR = TextEditingController();
  var drinkCTR = TextEditingController();
  int tea = 0;
  int bread = 0;
  int salad = 0;
  int ovqat = 0;
  int drink = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Choy',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (tea >= 0) {
                        tea++;
                        setState(() {});
                      }
                    });
                  },
                  icon: Icon(Icons.add_circle_outline),
                ),
                Text('${tea}'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (tea != 0) {
                        tea--;
                        setState(() {});
                      }
                    });
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Non',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (bread >= 0) {
                        bread++;
                        setState(() {});
                      }
                    });
                  },
                  icon: Icon(Icons.add_circle_outline),
                ),
                Text('${bread}'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (bread != 0) {
                        bread--;
                        setState(() {});
                      }
                    });
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Salat',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    controller: saladCTR,
                    onFieldSubmitted: (salad) {
                      if (isExist(salad)) {
                        //foodList.indexOf(element)
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Enter salad name',
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (salad >= 0) {
                            salad++;
                            setState(() {});
                          }
                        });
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    Text('${salad}'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (salad != 0) {
                            salad--;
                            setState(() {});
                          }
                        });
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Ovqat',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    controller: foodCTR,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Enter ovqat name',
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (ovqat >= 0) {
                            ovqat++;
                            setState(() {});
                          }
                        });
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    Text('${ovqat}'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (ovqat != 0) {
                            ovqat--;
                            setState(() {});
                          }
                        });
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Ichimlik',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    controller: drinkCTR,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Enter ichimlik name',
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (drink >= 0) {
                            drink++;
                            setState(() {});
                          }
                        });
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    Text('${drink}'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (drink != 0) {
                            drink--;
                            setState(() {});
                          }
                        });
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width - 100, 55)),
                onPressed: () {
                  if (isExist(saladCTR.text) &&
                      isExist(foodCTR.text) &&
                      isExist(drinkCTR.text)) {
                    box.write("choy", "$tea");
                    box.write("non", "$bread");
                    box.write("ovqat", "${foodCTR.text},${ovqat} ta");
                    box.write("salat", "${saladCTR.text},${salad} ta");
                    box.write("ichimlik", "${drinkCTR.text},${drink} ta");
                  }
                },
                child: Text(
                    "Order ${tea * getCost('choy') + bread * getCost('non') + ovqat * getCost(foodCTR.text) + salad * getCost(saladCTR.text) + drink * getCost(drinkCTR.text)} so`m"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

bool isExist(String name) {
  var isExt = false;
  foodList.forEach((element) {
    if (element.name == name) {
      isExt = true;
    }
  });
  return isExt;
}

int getCost(String name) {
  int cost = 0;
  foodList.forEach((element) {
    if (element.name.toLowerCase() == name.toLowerCase()) {
      cost = element.cost;
    }
  });
  return cost;
}
