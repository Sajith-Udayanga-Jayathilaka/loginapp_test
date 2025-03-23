import 'package:flutter/material.dart';
import 'package:loginapp/controller/auth_controller.dart';
import 'package:loginapp/screens/edit_profile.dart';
import 'package:loginapp/utils/custom_navigator.dart';
import 'package:loginapp/widgets/custom_button.dart';
import 'package:loginapp/widgets/custom_text.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: CustomText(
          text: "Dashboard",
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.5,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.person_pin,
                      size: 100,
                      color: Colors.blue,
                    ),
                    CustomText(text: "Name"),
                    CustomText(text: "example@example.com"),
                    CustomText(text: "0777123456"),
                  ],
                ),
              ),
            ),
            CustomButton1(
              size: size,
              buttonName: "Edit Profile",
              colors: [Colors.blue, Colors.lightBlue],
              ontap: () {
                CustomNavigator.goTo(context, const EditProfile());
              },
            ),
            CustomButton1(
              size: size,
              buttonName: "Log Out",
              colors: [Colors.blue, Colors.lightBlue],
              ontap: () {
                AuthController.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
