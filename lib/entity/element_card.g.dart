// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ElementCardAdapter extends TypeAdapter<ElementCard> {
  @override
  final int typeId = 1;

  @override
  ElementCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ElementCard(
      keyss: (fields[0] as List).cast<dynamic>(),
      value: (fields[1] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, ElementCard obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.keyss)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElementCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
