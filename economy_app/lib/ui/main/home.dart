import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/blocks/money_bloc/money_block.dart';
import 'package:project/blocks/money_bloc/money_event.dart';
import 'package:project/blocks/money_bloc/money_state.dart';
import 'package:project/ui/main/view/account_screen.dart';
import 'package:project/ui/main/view/main_screen.dart';
import 'package:project/ui/main/view/money_screen.dart';
import 'package:project/widgets/main/add.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// основной блок
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController controller;
  final TextEditingController name = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    BlocProvider.of<MoneyBloc>(context).add(const LoadMoneys());
  }

  // appbar который меняет свой title  в зависимости от  body
  AppBar? getTitle(BuildContext context, int index) {
    switch (index) {
      case 0:
        return AppBar(
          title: const Text(
            'Study',
            style: TextStyle(color: Colors.black87),
          ),
        );
      case 1:
        return AppBar(
          title: const Text(
            "Dictionaries",
            style: TextStyle(color: Colors.black87),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  addSpending(context, name);
                },
                icon: const Icon(Icons.add)),
          ],
        );
      case 2:
        return AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black87),
          ),
        );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getTitle(context, controller.index),
        body: SafeArea(
          child: BlocBuilder<MoneyBloc, MoneyState>(builder: (context, state) {
            if (state is LoadedMoneyState) {
              return TabBarView(
                controller: controller,
                children: [
                  MainScreen(moneysList: state.moneyList),
                  MoneyScreen(moneyList: state.moneyList),
                  const AccountScreen(),
                ],
              );
            }
            if (state is ErrorState) {
              return Center(
                child: Text(state.message),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CustomNavigationBar(
            blurEffect: true,
            isFloating: true,
            borderRadius: const Radius.circular(22),
            iconSize: 22.0,
            selectedColor: const Color(0xff040307),
            strokeColor: const Color(0x30040307),
            unSelectedColor: const Color(0xffacacac),
            backgroundColor: Colors.white,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.cast_for_education_rounded),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.lightbulb_outline),
              ),
            ],
            currentIndex: controller.index,
            onTap: (index) {
              setState(() {
                controller.animateTo(index);
              });
            },
          ),
        ));
  }
}
