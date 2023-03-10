import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/service/notification.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    FirebaseAuth.instance.userChanges().listen((event) {
      user = event;
      notifyListeners();
    });
  }
  User? user;
  String? userMail;
  bool get isLoggedIn => user != null;

  Future<bool> checkLogin() async {
    user = FirebaseAuth.instance.currentUser;
    userMail = user?.email;
    try {
      await user?.reload();
    } catch (_) {
      user = null;
      userMail = null;
      notifyListeners();
      return false;
    }
    return true;
  }

// вход
  Future<User?> login(context,
      {required String email, required String password}) async {
    try {
      user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        NotificationService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку',
          true,
        );
        return null;
      } else {
        NotificationService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
        return null;
      }
    }
  }

// выход
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

// регистрация
  Future registration(context, {required password, required email}) async {
    try {
      user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        NotificationService.showSnackBar(
          context,
          'Такой Email уже используется, повторите попытку с использованием другого Email',
          true,
        );
        return;
      } else {
        NotificationService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
      }
    }
  }
//
}
