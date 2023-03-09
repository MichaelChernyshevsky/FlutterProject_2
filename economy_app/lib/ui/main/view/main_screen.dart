import 'package:flutter/material.dart';
import 'package:project/models/app_routes.dart';
import 'package:project/models/money.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.moneysList});

  final List<Money> moneysList;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [Text("hello")],
    );
  }
}
