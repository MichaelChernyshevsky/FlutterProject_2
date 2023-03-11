import 'package:equatable/equatable.dart';
import 'package:project/models/money.dart';

abstract class MoneyEvent extends Equatable {
  const MoneyEvent();
  @override
  List<Object> get props => [];
}

class LoadMoneysEvent extends MoneyEvent {
  const LoadMoneysEvent();
}

class AddMoneyEvent extends MoneyEvent {
  final Money money;

  const AddMoneyEvent({
    required this.money,
  });

  @override
  List<Object> get props => [money];
}

class ChangeMoneyEvent extends MoneyEvent {
  final Money money;
  const ChangeMoneyEvent({
    required this.money,
  });

  @override
  List<Object> get props => [money];
}

class DeleteMoneyEvent extends MoneyEvent {
  final Money money;
  const DeleteMoneyEvent({
    required this.money,
  });

  @override
  List<Object> get props => [money];
}
