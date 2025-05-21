import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'caretaker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'my_account.dart';
import 'booking.dart';
import 'settings.dart';
import 'home.dart';

class ServicesHomePage extends StatefulWidget {
  @override
  _ServicesHomePageState createState() => _ServicesHomePageState();
}

class _ServicesHomePageState extends State<ServicesHomePage> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  final Color darkBrown = Color(0xFF210B09);
  final Color softBrown = Color(0xFFD09890);

  int selectedIndex = 0;

  final List<Map<String, dynamic>> services = [
    {'icon': FontAwesomeIcons.soap, 'label': 'Cleaning'},
    {'icon': FontAwesomeIcons.utensils, 'label': 'Cooking'},
    {'icon': FontAwesomeIcons.seedling, 'label': 'Garden'},
    {'icon': FontAwesomeIcons.wheelchair, 'label': 'Caretaker'},
    {'icon': FontAwesomeIcons.baby, 'label': 'Babysitter'},
    {'icon': FontAwesomeIcons.clock, 'label': 'Hourly Help'},
  ];

  void onBottomNavTap(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Stay on current page (Home)
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
    }
  }

  void onServiceTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CaretakerServicesPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CaretakerServicesPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CaretakerServicesPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CaretakerServicesPage()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CaretakerServicesPage()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CaretakerServicesPage()),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CaretakerServicesPage()),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CaretakerServicesPage()),
        );
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CaretakerServicesPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "HOME",
          style: TextStyle(
            //add the font and font size
          ),
        ),
        centerTitle: true,
        //profile picture
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                backgroundImage:
                    _profileImage != null
                        ? FileImage(_profileImage!)
                        : const NetworkImage("https://i.pravatar.cc/150")
                            as ImageProvider,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF210B09),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        _profileImage != null
                            ? FileImage(_profileImage!)
                            : const NetworkImage("https://i.pravatar.cc/150")
                                as ImageProvider,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "XYZ",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(height: 35),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyAccountPage()),
                    );
                  },
                  child: Text(
                    "My Account",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingHistoryPage(),
                      ),
                    );
                  },
                  child: Text(
                    "History",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),

                GestureDetector(
                  child: Text(
                    "Settings",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),

                GestureDetector(
                  child: Text(
                    "About Us",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),

                SizedBox(height: 50),
                GestureDetector(
                  child: Text(
                    "LOG OUT",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: softBrown,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.black),
                ],
              ),
            ),

            // Section Title
            Text(
              "Services",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
            SizedBox(height: 12),

            // Grid of Services
            Expanded(
              child: GridView.builder(
                itemCount: services.length,
                padding: EdgeInsets.only(top: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final service = services[index];
                  return GestureDetector(
                    onTap: () => onServiceTap(index),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: darkBrown,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Center(
                            child: FaIcon(
                              service['icon'],
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          service['label'],
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: darkBrown,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: onBottomNavTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }
}

// Dummy Page to simulate navigation targets
class DummyPage extends StatelessWidget {
  final String title;

  DummyPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title Content')),
    );
  }
}
