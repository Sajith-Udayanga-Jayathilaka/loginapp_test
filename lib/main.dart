import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/providers/edit_profile_provider.dart';
import 'package:loginapp/providers/signin_provider.dart';
import 'package:loginapp/providers/signup_provider.dart';
import 'package:loginapp/screens/loading_screen.dart';
import 'package:loginapp/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SigninProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SignupProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => EditProfileProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: LoadingScreen(),
    );
  }
}
