import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:project/blocks/money_bloc/money_event.dart';
import 'package:project/blocks/money_bloc/money_state.dart';
import 'package:project/models/money.dart';
import 'package:project/service/money_service.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  MoneyBloc(this.moneySevice) : super(MoneyState()) {
    on<LoadMoneysEvent>(_onLoadMoneys);
    on<AddMoneyEvent>(_onAddMoney);
    on<ChangeMoneyEvent>(_onChangeMoney);
    on<DeleteMoneyEvent>(_onDeleteMoney);
  }

  final MoneyRepository moneySevice;

  Future<void> _onLoadMoneys(LoadMoneysEvent event, Emitter<MoneyState> emit) async {
    final List<Money>? moneys = await moneySevice.getMoneys();
    if (moneys != null) {
      emit(LoadedMoneyState(moneys: moneys));
    } else {
      emit(ErrorState('Could not load moneys'));
    }
  }

  Future<void> _onAddMoney(AddMoneyEvent event, Emitter<MoneyState> emit) async {
    final bool isOk = await moneySevice.addMoney(event.money);
    if (isOk) {
      final List<Money> moneys = (await moneySevice.getMoneys())!;
      emit(LoadedMoneyState(moneys: moneys));
    } else {
      emit(ErrorState('Could not upload moneys'));
    }
  }

  void _onChangeMoney(ChangeMoneyEvent event, Emitter<MoneyState> emit) {}

  void _onDeleteMoney(DeleteMoneyEvent event, Emitter<MoneyState> emit) {}
}
