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
        padding: EdgeInsets.only(top: 8, right: 8, left: 8),
        itemBuilder: (context, index) {
          var element = moneysList[index];
          if (element.description != '') {
            desc = element.description.toString();
            desc = "( $desc )";
          } else {
            desc = '';
          }
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.amber,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 9,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(
                          DateFormat.yMd().format(element.wastedDate),
                          style: const TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 6,
                            left: element.type?.isEmpty ?? false ? 0 : 6,
                          ),
                          child: Text(
                            element.type.toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: Text(
                          desc,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          element.waste.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: element.walue.isEmpty ? 0 : 6),
                          child: Text(
                            element.walue.toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
