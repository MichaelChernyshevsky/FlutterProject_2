import 'package:flutter/material.dart';
import 'package:project/models/app_routes.dart';
import 'package:project/provider/user.provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        if (await Provider.of<UserProvider>(context, listen: false).checkLogin()) {
          Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.home, (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
