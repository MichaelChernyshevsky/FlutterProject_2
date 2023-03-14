import 'package:flutter/material.dart';
// import 'package:project/analysis/months.dart';
import 'package:project/models/money.dart';
import 'package:project/widgets/main/date_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key, required this.moneysList});

  final List<Money> moneysList;
  // late Map<String, List<Money>> analisedmonths = analiseMonth(moneysList);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<List<Money>> newvariant = [
    [Money(30, "description", "home", "ru", 76, DateTime.now())],
    [Money(40, "sdada", "no", "eu", 1, DateTime.now())],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [DataScreen(analisedmonths: newvariant)],
    );
  }
}
