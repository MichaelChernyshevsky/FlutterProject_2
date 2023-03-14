import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/blocks/money_bloc/money_block.dart';
import 'package:project/blocks/money_bloc/money_event.dart';
import 'package:project/models/money.dart';
import 'package:project/service/notification.dart';
import 'package:project/widgets/elements/type.picker.dart';

Future<void> addSpending(
  context,
) async {
  final MoneyBloc bloc = BlocProvider.of<MoneyBloc>(context);
  // переменные которые будут предаваться
  TextEditingController waste = TextEditingController();
  TextEditingController description = TextEditingController();
  String type = "";
  TextEditingController walue = TextEditingController();
  TextEditingController dollar = TextEditingController();
  DateTime wastedDate = DateTime.now();

  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.pink,
          title: const Text("Create new waste"),
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          actionsOverflowButtonSpacing: 20,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: "Amount"),
                keyboardType: TextInputType.number,
                controller: waste,
              ),
              TextField(
                decoration: const InputDecoration(
                    hintText: "Description (not necessary)"),
                controller: description,
              ),
              TextField(
                decoration: const InputDecoration(hintText: "Walue"),
                controller: walue,
              ),
              TextField(
                decoration:
                    const InputDecoration(hintText: "Relation to the dollar"),
                keyboardType: TextInputType.number,
                controller: dollar,
              ),
              TypePicker(chosetype: type),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'CANCEL',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (waste.text.isEmpty ||
                    walue.text.isEmpty ||
                    dollar.text.isEmpty) {
                  NotificationService.showSnackBar(
                    context,
                    'Not all fields are filled in',
                    true,
                  );
                } else {
                  bloc.add(AddMoneyEvent(
                      money: Money(
                    double.parse(waste.text),
                    description.text,
                    type,
                    walue.text,
                    double.parse(dollar.text),
                    wastedDate,
                  )));
                }

                waste.clear();
                description.clear();
                walue.clear();
                dollar.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
