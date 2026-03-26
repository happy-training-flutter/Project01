// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DemoListModelAdapter extends TypeAdapter<DemoListModel> {
  @override
  final int typeId = 0;

  @override
  DemoListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DemoListModel(
      title: fields[0] as String,
      description: fields[1] as String,
      price: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DemoListModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DemoListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
