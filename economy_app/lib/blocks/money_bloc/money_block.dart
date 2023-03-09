import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:project/blocks/money_bloc/money_event.dart';
import 'package:project/blocks/money_bloc/money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  MoneyBloc(this.moneySevice) : super(MoneyState()) {
    on<LoadMoneys>(_onLoadMoneys);
    on<AddMoney>(_onAddMoney);
    on<ChangeMoney>(_onChangeMoney);
    on<DeleteMoney>(_onDeleteMoney);
  }

  final MoneySevice moneySevice;

  Future<void> _onLoadMoneys(LoadMoneys event, Emitter<MoneyState> emit) async {
    final bool isOk = await moneySevice.loadMoneys();
    if (isOk) {
      emit(LoadedMoneyState(moneys: moneySevice.moneys.toList()));
    } else {
      emit(ErrorState('Could not load moneys'));
    }
  }

  Future<void> _onAddMoney(AddMoney event, Emitter<MoneyState> emit) async {
    final bool isOk = await moneySevice.addMoney(event.money);
    if (isOk) {
      emit(LoadedMoneyState(moneys: moneySevice.moneys.toList()));
    } else {
      emit(ErrorState('Could not upload moneys'));
    }
  }

  void _onChangeMoney(ChangeMoney event, Emitter<MoneyState> emit) {}

  void _onDeleteMoney(DeleteMoney event, Emitter<MoneyState> emit) {}
}
