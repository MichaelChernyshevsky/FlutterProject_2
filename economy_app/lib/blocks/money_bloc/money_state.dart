import 'package:equatable/equatable.dart';
import 'package:project/models/money.dart';

class MoneyState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingState extends MoneyState {}

class ErrorState extends MoneyState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class LoadedMoneyState extends MoneyState {
  final List<Money> moneys;
  LoadedMoneyState({
    this.moneys = const <Money>[],
  });

  @override
  List<Object> get props => [moneys];
}
