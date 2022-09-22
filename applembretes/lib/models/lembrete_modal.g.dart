// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lembrete_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LembreteAdapter extends TypeAdapter<Lembrete> {
  @override
  final int typeId = 0;

  @override
  Lembrete read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lembrete(
      title: fields[0] as String?,
      note: fields[1] as String?,
      creation_date: fields[2] as DateTime?,
      done: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Lembrete obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.creation_date)
      ..writeByte(3)
      ..write(obj.done);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LembreteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
