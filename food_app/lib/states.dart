import 'package:food_app/models/foodModel.dart';
import 'package:get_storage/get_storage.dart';

List<FoodModel> foodList = [
  FoodModel("Sho'rva", 17000),
  FoodModel("Osh", 28000),
  FoodModel("Mastava", 13000),
  FoodModel("Manti", 27000),
  FoodModel("KFC 500 gr", 40000),
  FoodModel("choy", 4000),
  FoodModel("non", 3000),

];
final box = GetStorage();