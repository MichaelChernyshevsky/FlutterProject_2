import 'package:hive_flutter/adapters.dart';

part 'money.g.dart';

@HiveType(typeId: 0)
class Money extends HiveObject {
  @HiveField(0)
  final double waste;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String? type;
  @HiveField(3)
  final String walue;
  @HiveField(4)
  final double dollar;
  @HiveField(5)
  final DateTime wastedDate;

  Money(
    this.waste,
    this.description,
    this.type,
    this.walue,
    this.dollar,
    this.wastedDate,
  );
}
