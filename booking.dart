import 'package:flutter/material.dart';
import 'home.dart'; // Ensure this exists
// import 'options.dart'; // Uncomment if you use OptionsPage
import 'home.dart'; // Replace with your actual home screen
import 'settings.dart';
import 'services.dart'; // Replace with your actual settings screen

class BookingHistoryPage extends StatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  State<BookingHistoryPage> createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFFC17A6E);
    const Color cardColor = Colors.white;
    const Color iconBgColor = Color(0xFF2C0E0C);
    const Color bottomNavColor = Color(0xFF2C0E0C);

    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          const SizedBox(height: 40),

          // Back arrow
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),

          // Header Icon and Title
          const SizedBox(height: 10),
          const Icon(Icons.history, size: 70, color: Colors.brown),
          const SizedBox(height: 8),
          const Text(
            "Booking History",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          // Booking Cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                BookingCard(
                  icon: Icons.cleaning_services,
                  title: "Cleaning",
                  date: "January 10th",
                ),
                BookingCard(
                  icon: Icons.local_florist,
                  title: "Garden",
                  date: "January 17th",
                ),
                BookingCard(
                  icon: Icons.soup_kitchen,
                  title: "Cooking",
                  date: "January 20th",
                ),
                BookingCard(
                  icon: Icons.access_time,
                  title: "Hourly Help",
                  date: "March 10th",
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: bottomNavColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          // Navigation logic based on index
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ServicesHomePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsPage()),
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

class BookingCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;

  const BookingCard({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF2C0E0C),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
