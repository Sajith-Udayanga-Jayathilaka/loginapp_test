import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/controller/auth_controller.dart';
import 'package:loginapp/screens/login_page.dart';
import 'package:loginapp/screens/signup_page.dart';
import 'package:loginapp/utils/custom_navigator.dart';
import 'package:loginapp/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthController.chechAuthState(context);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText("WELCOME",
                  speed: Duration(milliseconds: 450),
                  textStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Colors.blueAccent
                  )
                  )
                ])),
        ],
      ),
    );
  }
}
