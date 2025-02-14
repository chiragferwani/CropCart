import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart'; // For Better Icons

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us", style: TextStyle(fontFamily: 'boldfont')),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 Project Logo (Center)
            Center(
              child: Image.asset(
                'assets/images/cropcart.png', // Project Logo Path
                height: 120,
              ),
            ),
            SizedBox(height: 20),

            // 🔹 Help & Support Heading
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Ionicons.headset, color: Colors.blue, size: 30), // Support Icon
                SizedBox(width: 10),
                Text(
                  "Help & Support",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'boldfont'),
                ),
              ],
            ),
            SizedBox(height: 30),

            // 🔹 Contact Information
            _buildContactInfo(
              icon: Ionicons.call,
              label: "Phone",
              value1: "+91 87673 86340",
              value2: "+91 90280 65046",
              isPhone: true, // Enables call functionality
            ),

            SizedBox(height: 20),

            _buildContactInfo(
              icon: Ionicons.mail,
              label: "Email",
              value1: "connect.cropcart@gmail.com",
              value2: "chiragferwani@gmail.com",
              isPhone: false, // Enables email functionality
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Function to Build Contact Info Tiles
  Widget _buildContactInfo({required IconData icon, required String label, required String value1, required String value2, required bool isPhone}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'boldfont'),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              _buildContactRow(icon, value1, isPhone),
              SizedBox(height: 10),
              _buildContactRow(icon, value2, isPhone),
            ],
          ),
        ),
      ],
    );
  }

  // 🔹 Function to Build Individual Contact Row
  Widget _buildContactRow(IconData icon, String value, bool isPhone) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 26),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 16, fontFamily: 'boldfont'),
          ),
        ),
      ],
    );
  }
}
