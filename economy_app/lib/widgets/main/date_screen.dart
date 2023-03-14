import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project/analysis/months_analise.dart';
import 'package:project/models/money.dart';

class DataScreen extends StatelessWidget {
  DataScreen({
    super.key,
    required this.months,
  });
  final List<Money> months;
  late Map<String, List> moneysTypesOnMonths = analiseNameMonth(months);

  @override
  Widget build(BuildContext context) {
    var analisedmonths;
    return Expanded(
        child: ListView.builder(
            itemCount: analisedmonths.length,
            padding: EdgeInsets.only(top: 8, right: 8, left: 8),
            itemBuilder: (context, index) {
              var elements = analisedmonths[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                margin: EdgeInsets.only(bottom: 8),
                child: Row(children: [Text("i can do it")]),
              );
            }));
  }
}
