import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project/analysis/months_analise.dart';
import 'package:project/models/money.dart';
import 'package:project/widgets/elements/statistic_widget.dart';

class DataScreen extends StatelessWidget {
  DataScreen({
    super.key,
    required this.months,
  });
  final List<Money> months;
  late Map<String, Map<String, Double>> moneysTypesOnMonths =
      analiseNameMonth(months);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: moneysTypesOnMonths.length,
            padding: EdgeInsets.only(top: 8, right: 8, left: 8),
            itemBuilder: (context, index) {
              int total = 0;
              Map<String, Double> elements = moneysTypesOnMonths[index] as  Map<String, Double>;
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                margin: EdgeInsets.only(bottom: 8),
                child: Column(
                  children: [
                    Text(moneysTypesOnMonths.keys.toList().elementAt(index)),
                    ListView.builder(
                        itemCount: elements.length,
                        itemBuilder: (context, index) {
                          return Statistic(
                              name: elements.keys.toList().elementAt(index),
                              sum: elements[index].toString(),
                              );
                        }
                    ),
                    Statistic(name: "Total", sum: total.toString())
                    // Statistic(name: , sum: ,)
                  ],
                ),
              );
            }));
  }
}
