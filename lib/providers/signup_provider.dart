import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:loginapp/controller/auth_controller.dart';

class SignupProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  //Sign Up User
  Future<void> signUpUser(BuildContext context) async {
    if (_emailController.text.isEmpty) {
      Logger().e("Please Enter Email");
    } else if (_passwordController.text.isEmpty) {
      Logger().e("Please Enter Password");
    } else if (_passwordController.text != _confirmPasswordController.text) {
      Logger().e("Password Does Not Match");
    } else if (_nameController.text.isEmpty) {
      Logger().e("Please Enter Your Name");
    } else if (_phoneController.text.isEmpty) {
      Logger().e("Please Enter Phone Number");
    } else {
      AuthController()
          .createUserAccount(
              emailAddress: _emailController.text,
              password: _passwordController.text,
              name: _nameController.text,
              phoneNumber: _phoneController.text)
          .then((value) {
        clearText();
      });
    }
  }

  void clearText() {
    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }
}
