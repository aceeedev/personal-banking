// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citi_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CitiTransactionAdapter extends TypeAdapter<CitiTransaction> {
  @override
  final int typeId = 2;

  @override
  CitiTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CitiTransaction(
      date: fields[0] as DateTime,
      description: fields[1] as String,
      amount: fields[2] as double,
      status: fields[20] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CitiTransaction obj) {
    writer
      ..writeByte(4)
      ..writeByte(20)
      ..write(obj.status)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CitiTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
