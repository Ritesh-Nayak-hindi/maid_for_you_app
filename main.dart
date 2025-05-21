import 'package:flutter/material.dart';
import 'login.dart';
import 'Welcome.dart';
import 'sign_in.dart';
import 'sign_up.dart';
import 'SucessPage.dart';
// Import your login page file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaidForYou',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/sucesspage': (context) => const SucessPage(),
      },
      theme: ThemeData(
        fontFamily: 'LilitaOne-Regular', // Set global font family here
      ),
    );
  }
}
