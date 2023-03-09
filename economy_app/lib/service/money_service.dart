import 'package:project/models/money.dart';
import 'package:project/widgets/main/moneys_list.dart';

class MoneySevice {
  final List<MoneyList> moneys;

  // Listen to Firebase provider for changes
  // If dictionaries changed => update

  Future<bool> loadMoneys() async {
    // Firebase load
    // Hive clean and add all new dictionaries
    // or
    // Hive load

    return true;
  }

  Future<bool> addMoneyToList(Money money) async {
    const bool isOk = true;
    // Hive add
    // Firebase add
    // In case of error => isOk = false

    moneys.addMoney;
    return isOk;
  }

  Future<bool> deleteMoneyFromList(Money money) async {
    const bool isOk = true;
    // Hive add
    // Firebase add
    // In case of error => isOk = false

    moneys.deleteMoney(money);

    return isOk;
  }
}
