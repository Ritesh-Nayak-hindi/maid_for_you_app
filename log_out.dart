import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'sign_in.dart';

class SucessPage extends StatefulWidget {
  const SucessPage({super.key});

  @override
  State<SucessPage> createState() => _SucessPageState();
}

class _SucessPageState extends State<SucessPage> {
  @override
  void initState() {
    super.initState();

    // Navigate to HomePage after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D0D0A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(OctIcons.verified_24, size: 200.0, color: Color(0xFFD88D81)),
            SizedBox(height: 20),
            Text(
              "You have successfully",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD88D81),
                height: 1.3,
              ),
            ),
            Text(
              "logged Out!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD88D81),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
