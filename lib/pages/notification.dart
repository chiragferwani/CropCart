import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/navigation.dart';
import 'notification_service.dart'; // Import Global Notification Service

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
void initState() {
  super.initState();
  notificationService.addListener(() {
    if (mounted) {   // 🔹 Ensure the Widget is Mounted before calling setState
      setState(() {}); 
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation()));
            },
          ),
          title: Text("Notifications", style: TextStyle(fontFamily: 'boldfont')),
          backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notificationService.notifications.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade400, // Light Green Background
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.notifications, color: Colors.white), // Notification Icon
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      notificationService.notifications[index],
                      style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'boldfont'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
