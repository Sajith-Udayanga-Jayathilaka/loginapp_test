import 'package:flutter/material.dart';
import 'package:loginapp/providers/signup_provider.dart';
import 'package:loginapp/screens/login_page.dart';
import 'package:loginapp/utils/custom_navigator.dart';
import 'package:loginapp/widgets/custom_button.dart';
import 'package:loginapp/widgets/custom_form.dart';
import 'package:loginapp/widgets/custom_password.dart';
import 'package:loginapp/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<SignupProvider>(
            builder: (context, value, child) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create New Account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    CustomFormInput(
                      labelText: "Name",
                      pIcon: Icons.person,
                      errorMsg: "Please Enter Name",
                      controller: value.nameController,
                    ),
                    CustomFormInput(
                      type: TextInputType.phone,
                      labelText: "Phone",
                      pIcon: Icons.phone,
                      errorMsg: "Please Enter Phone Number",
                      controller: value.phoneController,
                    ),
                    CustomFormInput(
                      type: TextInputType.emailAddress,
                      labelText: "Email",
                      pIcon: Icons.email,
                      errorMsg: "Please Enter Email Address",
                      controller: value.emailController,
                    ),
                    PasswordInput(
                      isPassword: true,
                      controller: value.passwordController,
                      label: "Password",
                      prefixIcon: Icons.lock,
                    ),
                    PasswordInput(
                      isPassword: true,
                      controller: value.confirmPasswordController,
                      label: "Confirm Password",
                      prefixIcon: Icons.lock,
                    ),
                    CustomButton1(
                      size: size,
                      buttonName: "SignUP",
                      colors: [Colors.blue, Colors.lightBlue],
                      ontap: () {
                        value.signUpUser(context);
                      },
                    ),
                    CustomButton1(
                      size: size,
                      buttonName: "Go to Login",
                      colors: [Colors.blue, Colors.lightBlue],
                      ontap: () {
                        CustomNavigator.goTo(context, LoginPage());
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
