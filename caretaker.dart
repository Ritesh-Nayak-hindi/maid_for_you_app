import 'package:flutter/material.dart';
import 'male.dart';
import 'female.dart';
import 'services.dart';

class CaretakerServicesPage extends StatefulWidget {
  @override
  _CaretakerServicesPageState createState() => _CaretakerServicesPageState();
}

class _CaretakerServicesPageState extends State<CaretakerServicesPage> {
  String selectedGender = 'Male';

  final TextEditingController addressController = TextEditingController(
    text: '28, 11th Main..........',
  );
  final TextEditingController cityController = TextEditingController(
    text: 'Bengaluru, Karnataka',
  );

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Color(0xFFD09890);
    final Color darkBrown = Color(0xFF210B09);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Back button and title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    //add gesture here
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServicesHomePage(),
                        ),
                      );
                    },
                    child: Icon(Icons.arrow_back, color: Colors.brown),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Caretaker Services',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),

            // Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset('assets/images/caretaker.png', height: 250),
            ),

            // Curved background with form
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildTextField(addressController),
                    SizedBox(height: 12),
                    _buildTextField(cityController),

                    SizedBox(height: 24),
                    Text(
                      "Select the gender of the elderly",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildGenderButton('Male', selectedGender == 'Male'),
                        _buildGenderButton(
                          'Female',
                          selectedGender == 'Female',
                        ),
                      ],
                    ),

                    Spacer(),

                    // Find Expert Button
                    // Find Expert Button
                    GestureDetector(
                      onTap: () {
                        if (selectedGender == 'Male') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MaleHomePage(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FemaleHomePage(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: darkBrown,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(
                            "Find Expert",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  Widget _buildGenderButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = label;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              label == 'Male' ? Icons.man : Icons.woman,
              color: isSelected ? Colors.white : Colors.black,
              size: 36,
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
