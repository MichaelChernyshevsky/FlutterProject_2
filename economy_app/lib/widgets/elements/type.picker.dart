import 'package:flutter/cupertino.dart';

class TypePicker extends StatelessWidget {
  TypePicker({super.key, required this.chosetype});
  late String chosetype;
  int selecteditem = 0;
  List<String> types = <String>[
    "Any",
    "Home",
    "Food",
    "Study",
    "Transport",
    "Medicine",
    "Entertainments",
    "Subscriptions",
    "Clothes",
    "Family",
    "Other"
  ];

  void _showDialog(context, Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Type"),
        CupertinoButton(
          child: Text(types[selecteditem]),
          onPressed: () => _showDialog(
            context,
            CupertinoPicker(
              itemExtent: 20,
              onSelectedItemChanged: (int? index) {
                selecteditem = index!;
                chosetype = types[index];
              },
              children: List<Widget>.generate(types.length, (int index) {
                return Center(
                  child: Text(
                    types[index],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
