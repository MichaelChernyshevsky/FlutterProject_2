import 'package:flutter/material.dart';
import 'package:project/provider/user.provider.dart';
import 'package:project/widgets/elements/card_element_withoutIcon.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String? email = userProvider.userMail;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Your Account")),
        body: Column(
          children: [
            CardElementWithoutIcon(
              text: "Email: $email",
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
