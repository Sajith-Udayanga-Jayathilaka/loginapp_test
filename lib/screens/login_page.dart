import 'package:flutter/material.dart';
import 'package:loginapp/providers/signin_provider.dart';
import 'package:loginapp/screens/dashboard.dart';
import 'package:loginapp/screens/signup_page.dart';
import 'package:loginapp/utils/custom_navigator.dart';
import 'package:loginapp/widgets/custom_button.dart';
import 'package:loginapp/widgets/custom_form.dart';
import 'package:loginapp/widgets/custom_password.dart';
import 'package:loginapp/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<SigninProvider>(builder: (context, value, child) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login To Your Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              CustomFormInput(
                  labelText: "Email",
                  pIcon: Icons.email,
                  errorMsg: "Please Enter Email",
                  controller: value.emailController),
              PasswordInput(
                  isPassword: true,
                  controller: value.passwordController,
                  label: "Password",
                  prefixIcon: Icons.lock),
              CustomButton1(
                size: size,
                buttonName: "LogIn",
                colors: [Colors.blue, Colors.lightBlue],
                ontap: () {
                  value.signInUser(context);
                },
              ),
              CustomText(
                text: "Dont Have an Account?",
                fontSize: 10,
              ),
              CustomButton1(
                size: size,
                buttonName: "SignUP",
                colors: [Colors.blue, Colors.lightBlue],
                ontap: () {
                  CustomNavigator.goTo(context, SignupPage());
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
