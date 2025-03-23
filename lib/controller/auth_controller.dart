import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:loginapp/screens/dashboard.dart';
import 'package:loginapp/screens/login_page.dart';
import 'package:loginapp/screens/signup_page.dart';
import 'package:loginapp/utils/custom_navigator.dart';

class AuthController {
  Future<void> createUserAccount({
    required String emailAddress,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        addUser(value.user!.uid, name, emailAddress, phoneNumber);
      });
      Logger().i("");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().e('The account already exists for that email.');
      } else if (e.code == "Invalid-Password") {
        Logger().e('Invalid Email.');
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //Save User Data
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<void> addUser(
      String uid, String name, String email, String phoneNumber) {
    return users.doc(uid).set({
      "uid": uid,
      "name": name,
      "email": email,
      "phone": phoneNumber
    }).then((value) {
      Logger().i("User Added");
    }).catchError((e) {
      Logger().e(e);
    });
  }

  static Future<void> signInUser(
      {required String emailAddress, required String password, context}) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Logger().e('Wrong password provided for that user.');
      }
    }
  }

  static Future<void> chechAuthState(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            print('User is currently signed out!');
            CustomNavigator.goTo(context, const SignupPage());
          } else {
            print('User is signed in!');
            CustomNavigator.goTo(context, const Dashboard());
          }
        });
      },
    );
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
