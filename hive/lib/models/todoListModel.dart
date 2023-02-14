import 'package:hive/hive.dart';

part 'todoListModel.g.dart';

@HiveType(typeId: 0)
class TodoListModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String note;
  @HiveField(2)
  String currentTime;

  TodoListModel({
    required this.title,
    required this.note,
    required this.currentTime});
}
