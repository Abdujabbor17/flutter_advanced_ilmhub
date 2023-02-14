// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoListModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoListModelAdapter extends TypeAdapter<TodoListModel> {
  @override
  final int typeId = 0;

  @override
  TodoListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoListModel(
      title: fields[0] as String,
      note: fields[1] as String,
      currentTime: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TodoListModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.currentTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
