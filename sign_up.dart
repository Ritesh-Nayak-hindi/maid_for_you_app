import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'login.dart';

void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignUpPage(), debugShowCheckedModeBanner: false);
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Color backgroundColor = Color(0xFF210B09);
  final Color fieldColor = Colors.white;
  final Color textColor = Color(0xFFD09890); // Soft pinkish brown
  final Color buttonColor = Color(0xFFD09890); // Same as text for button

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Icon(Icons.arrow_back, color: textColor, size: 28),
              ),
              SizedBox(height: 24),
              Text(
                'Sign up into your\naccount',
                style: TextStyle(
                  color: textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 40),
              _buildTextField(
                label: 'Name',
                icon: Icons.person_outline,
                controller: nameController,
              ),
              SizedBox(height: 20),
              _buildTextField(
                label: 'Email',
                icon: Icons.email_outlined,
                controller: emailController,
              ),
              SizedBox(height: 20),
              _buildTextField(
                label: 'Password',
                icon: Icons.lock_outline,
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(height: 20),
              _buildTextField(
                label: 'Confirm Password',
                icon: Icons.lock_outline,
                obscureText: true,
                controller: confirmPasswordController,
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                  );
                },
                child: Text(
                  'Already have an account? Sign in',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print("Name: ${nameController.text}");
                    print("Email: ${emailController.text}");
                    print("Password: ${passwordController.text}");
                    print(
                      "Confirm Password: ${confirmPasswordController.text}",
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: Icon(icon, color: Colors.black),
        ),
      ),
    );
  }
}
