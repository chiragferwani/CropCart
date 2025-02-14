import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GrievanceScreen extends StatefulWidget {
  @override
  _GrievanceScreenState createState() => _GrievanceScreenState();
}

class _GrievanceScreenState extends State<GrievanceScreen> {
  File? _selectedImage;
  TextEditingController issueController = TextEditingController();

  // 🔹 Function to Pick Image from Camera
  Future<void> _pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // 🔹 Function to Pick Image from Gallery
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // 🔥 Function to Show Pop-Up on Button Click
  void _showIssuePopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Issue Submitted", style: TextStyle(fontFamily: 'boldfont')),
          content: Text("Your issue has been recorded & will be resolved soon!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Pop-up Close Karne Ke Liye
              },
              child: Text("OK", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Raise a Grievance", style: TextStyle(fontFamily: 'boldfont')),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 Image Input
            _selectedImage != null
                ? Image.file(_selectedImage!, height: 200, width: 200, fit: BoxFit.cover)
                : Icon(Icons.image, size: 100, color: Colors.grey),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.camera_alt, color: Colors.white, size: 28),
                  label: Text(
                    "Camera",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: _pickImageFromCamera,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  icon: Icon(Icons.photo_library, color: Colors.white, size: 28),
                  label: Text(
                    "Gallery",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: _pickImageFromGallery,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // 🔹 Large TextField for Issue Description
            TextField(
              controller: issueController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "What is the issue?",
                hintStyle: TextStyle(fontFamily: 'boldfont', fontSize: 18),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),

            SizedBox(height: 20),

            // 🔹 Raise Issue Button (Pop-Up Show Karega)
            ElevatedButton(
              onPressed: _showIssuePopup, // Button Click Pe Pop-Up Show Hoga
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Raise Issue", style: TextStyle(fontSize: 18, fontFamily: 'boldfont', color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
