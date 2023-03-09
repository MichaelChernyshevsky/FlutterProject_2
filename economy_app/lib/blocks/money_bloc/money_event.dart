import 'package:equatable/equatable.dart';
import 'package:project/models/money.dart';

abstract class MoneyEvent extends Equatable {
  const MoneyEvent();
  @override
  List<Object> get props => [];
}

class LoadMoneys extends MoneyEvent {
  const LoadMoneys();
}

class AddMoney extends MoneyEvent {
  final Money money;

  const AddMoney({
    required this.money,
  });

  @override
  List<Object> get props => [money];
}

class ChangeMoney extends MoneyEvent {
  final Money money;
  const ChangeMoney({
    required this.money,
  });

  @override
  List<Object> get props => [money];
}

class DeleteMoney extends MoneyEvent {
  final Money money;
  const DeleteMoney({
    required this.money,
  });

  @override
  List<Object> get props => [money];
}
