// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankTransactionAdapter extends TypeAdapter<BankTransaction> {
  @override
  final int typeId = 3;

  @override
  BankTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BankTransaction(
      date: fields[0] as DateTime,
      description: fields[1] as String,
      amount: fields[2] as double,
      comments: fields[10] as String,
      checkNumber: fields[11] as String,
      balance: fields[12] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BankTransaction obj) {
    writer
      ..writeByte(6)
      ..writeByte(10)
      ..write(obj.comments)
      ..writeByte(11)
      ..write(obj.checkNumber)
      ..writeByte(12)
      ..write(obj.balance)
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
      other is BankTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
