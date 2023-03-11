import 'package:flutter/material.dart';
import 'package:project/models/money.dart';
import 'package:project/widgets/main/moneys_list.dart';

class MoneyScreen extends StatefulWidget {
  const MoneyScreen({super.key, required this.moneyList});

  final List<Money> moneyList;

  @override
  State<MoneyScreen> createState() => _MoneyScreenState();
}

class _MoneyScreenState extends State<MoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoneysList(
          moneysList: widget.moneyList,
        ),
      ],
    );
  }
}
