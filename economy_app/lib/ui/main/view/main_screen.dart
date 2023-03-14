import 'package:flutter/material.dart';
// import 'package:project/analysis/months.dart';
import 'package:project/models/money.dart';
import 'package:project/widgets/main/date_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key, required this.moneysList});

  final List<Money> moneysList;
  // late Map<String, List<Money>> analisedmonths = analiseMonth(moneysList);

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        moneysList.isNotEmpty ? DataScreen(
          months: moneysList,
        ) : Text('So far there are no records')
      ],
    );
  }
}
