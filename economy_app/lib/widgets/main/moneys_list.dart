import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/money.dart';

class MoneysList extends StatelessWidget {
  const MoneysList({
    super.key,
    required this.moneysList,
  });

  final List<Money> moneysList;

  @override
  Widget build(BuildContext context) {
    String desc = "";
    return Expanded(
      child: ListView.builder(
        itemCount: moneysList.length,
        itemBuilder: (context, index) {
          var element = moneysList[index];
          if (element.description != '') {
            desc = element.description.toString();
            desc = "( $desc )";
          } else {
            desc = '';
          }
          return Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Row(
                      children: [
                        Text(
                          DateFormat.yMd().format(element.wastedDate),
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          element.type.toString(),
                        ),
                        Text(desc),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          element.waste.toString(),
                        ),
                        const Text(' '),
                        Text(
                          element.walue.toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
