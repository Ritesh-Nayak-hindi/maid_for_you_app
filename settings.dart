import 'package:flutter/material.dart';
import 'home.dart';
import 'services.dart';
import 'my_account.dart';
import 'change_pass.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;

  int selected_index = 0;
  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFC17A6E);
    const Color bottomBarColor = Color(0xFF2C0E0C);
    const Color darkText = Colors.black;
    const Color lightText = Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Icon(Icons.arrow_back, color: Colors.white, size: 28),
              ),
            ),

            // Settings Icon and Title
            const SizedBox(height: 10),
            const Center(
              child: Icon(Icons.settings, size: 70, color: bottomBarColor),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: lightText,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Account Settings Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Account Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),

            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAccountPage()),
                );
              },
              child: const SettingsItem(title: "Edit Profile"),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
              child: const SettingsItem(title: "Change  Password"),
            ),

            // Push Notification Toggle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Push Notifications",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: lightText,
                    ),
                  ),
                  Switch(
                    value: notificationsEnabled,
                    onChanged: (val) {
                      setState(() {
                        notificationsEnabled = val;
                      });
                    },
                    activeColor: bottomBarColor,
                    inactiveThumbColor: bottomBarColor,
                    inactiveTrackColor: Colors.white,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Other Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Other",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),

            const SizedBox(height: 10),
            const SettingsItem(title: "Feed Back"),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected_index,
        backgroundColor: bottomBarColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          setState(() {
            selected_index = index;
          });

          // Optional navigation logic
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ServicesHomePage()),
            );
          }
          // else if (index == 1) {
          //   Navigator.push(context,
          //   MaterialPageRoute(builder: (context)=>OptionsPage()),
          //   );
          // }
          else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  const SettingsItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
