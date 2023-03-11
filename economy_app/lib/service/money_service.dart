import 'package:get_it/get_it.dart';
import 'package:project/models/money.dart';
import 'package:project/service/hive_service.dart';

class MoneyRepository {
  HiveService hiveService = GetIt.I.get<HiveService>();

  Future<List<Money>?> getMoneys({DateTime? dateFilter}) async {
    // Firebase load
    // Hive clean and add all new dictionaries
    // or
    // Hive load
    final hivesMoney = hiveService.getMoneys(dateFilter: dateFilter);

    return hivesMoney;
  }

  Future<bool> addMoney(Money money) async {
    const bool isOk = true;

    return hiveService.addMoney(money);
    // Hive add
    // Firebase add
    // In case of error => isOk = false

    return isOk;
  }

  Future<bool> deleteMoney(Money money) async {
    const bool isOk = true;

    return hiveService.removeMoney(money);

    // Firebase add
    // In case of error => isOk = false

    return isOk;
  }
}
