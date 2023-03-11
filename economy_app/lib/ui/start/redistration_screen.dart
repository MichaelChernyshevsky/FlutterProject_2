import 'package:flutter/material.dart';
import 'package:project/models/app_routes.dart';
import 'package:project/provider/user.provider.dart';
import 'package:project/service/notification.dart';
import 'package:project/widgets/start_elements/registration_element.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _Registration();
}

class _Registration extends State<RegistrationScreen> {
  bool isHiddenPassword = true;

  TextEditingController email = TextEditingController();
  TextEditingController passwordMain = TextEditingController();
  TextEditingController passwordCheck = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    passwordMain.dispose();
    passwordCheck.dispose();
    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    if (passwordCheck.text != passwordMain.text) {
      NotificationService.showSnackBar(
        context,
        'Пароли должны совпадать',
        true,
      );
      return;
    }
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    final navigator = Navigator.of(context);
    await userProvider.registration(context,
        email: email.text.trim(), password: passwordMain.text.trim());
    if (userProvider.isLoggedIn) {
      navigator.pushNamed(AppRoute.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Зарегистрироваться'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputEmailReg(email: email),
              const SizedBox(height: 30),
              InputPasswordReg(
                hintText: "Введите пароль",
                passwordCheck: passwordCheck,
                tab: togglePasswordView,
                isHiddenPassword: isHiddenPassword,
              ),
              const SizedBox(height: 30),
              InputPasswordReg(
                hintText: "Введите пароль еще раз",
                passwordCheck: passwordMain,
                tab: togglePasswordView,
                isHiddenPassword: isHiddenPassword,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: signUp,
                child: const Center(child: Text('Регистрация')),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Войти',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
