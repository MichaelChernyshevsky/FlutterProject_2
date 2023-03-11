import 'package:equatable/equatable.dart';
import 'package:project/models/money.dart';

class MoneyList extends Equatable {
  final List<Money> moneys;

  const MoneyList._(this.moneys);

  factory MoneyList({List<Money>? words}) => MoneyList._(words ?? []);

  void addMoney(Money money) {
    moneys.add(money);
  }

  void deleteMoney(Money money) {
    moneys.remove(money);
  }

  @override
  List<Object?> get props => [moneys];
}
