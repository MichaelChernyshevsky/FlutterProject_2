import 'package:app_english/models/app_route.dart';
import 'package:app_english/models/dictionaries/dictionary.dart';

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
          moneysList: moneyList,
        ),
      ],
    );
  }
}
