import 'package:flutter/material.dart';
import 'services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'my_account.dart';
import 'booking.dart';
import 'settings.dart';
import 'log_out.dart';

class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
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
  final Color lightGrey = Colors.grey.shade300;

  int selected_index = 0;

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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SucessPage()),
                    );
                  },
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
              "customer profiles",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            SizedBox(height: 8),

            // Customer List
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: softBrown,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Kim_Jong-un_April_2019_%28cropped%29.jpg/960px-Kim_Jong-un_April_2019_%28cropped%29.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: 40.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name:", style: _labelStyle()),
                              Text("phno:", style: _labelStyle()),
                              Text("review:", style: _labelStyle()),
                              Text("services required:", style: _labelStyle()),
                            ],
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
        currentIndex: selected_index,
        backgroundColor: darkBrown,
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

  TextStyle _labelStyle() {
    return TextStyle(color: Colors.white, fontWeight: FontWeight.w700);
  }
}
