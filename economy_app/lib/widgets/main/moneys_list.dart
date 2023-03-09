import 'package:flutter/material.dart';
import 'package:project/models/money.dart';

class MoneysList extends StatelessWidget {
  const MoneysList({
    super.key,
    required this.moneysList,
  });

  final List<Money> moneysList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: moneysList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(

                // title: Text(
                //   moneysList[index],
                // ),
                ),
          );
        },
      ),
    );
  }
}
