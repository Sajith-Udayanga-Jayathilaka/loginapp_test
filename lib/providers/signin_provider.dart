import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:loginapp/controller/auth_controller.dart';
import 'package:loginapp/screens/dashboard.dart';
import 'package:loginapp/utils/custom_navigator.dart';

class SigninProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future<void> signInUser(BuildContext context) async {
    if (emailController.text.isEmpty) {
      Logger().e("Please check email");
    } else if (passwordController.text.isEmpty) {
      Logger().e("Please check password");
    } else {
      AuthController.signInUser(
              emailAddress: _emailController.text,
              password: _passwordController.text)
          .then((value) {
        clearTextField();
        CustomNavigator.goTo(context, const Dashboard());
      });
    }
  }

  void clearTextField() {
    _emailController.clear();
    _passwordController.clear();
  }
}
