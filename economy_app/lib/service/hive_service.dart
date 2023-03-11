import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/models/money.dart';

class HiveService {
  late final Box<Money> moneyBox;

  Future init() async {
    Hive.registerAdapter(MoneyAdapter());
    moneyBox = await Hive.openBox<Money>('moneyBox');
  }

  List<Money> getMoneys({DateTime? dateFilter}) {
    if (dateFilter != null) {
      return moneyBox.values
          .where((money) => money.wastedDate.month == dateFilter.month)
          .toList();
    }

    return moneyBox.values.toList();
  }

  Future<bool> addMoney(Money money) async {
    return (await moneyBox.add(money)) != -1;
  }

  Future<bool> removeMoney(Money money) => money.delete().then((_) {
        return true;
      }).catchError((_) {
        return false;
      });
}
