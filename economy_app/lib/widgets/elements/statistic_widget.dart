import 'dart:ffi';

import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  const Statistic({
    super.key,
    required this.name,
    required this.sum,
  });
  final String name;
  final String sum;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(name),
      Text(sum),
    ]);
  }
}
