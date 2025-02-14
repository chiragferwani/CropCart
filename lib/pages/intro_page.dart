import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/pages/navigation.dart';
import 'package:grocery_shop_app/pages/signup.dart';
import 'notification_service.dart';

import 'home_page.dart';

void someFunction() {
  notificationService.addNotification("New Order Received!");
}

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 80.0, right: 80.0, bottom: 40.0, top: 160.0),
            child: Image.asset('assets/images/cropcart.png'),
          ),
          
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'We deliver groceries at your doorstep',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'boldfont', fontSize: 36, fontWeight: FontWeight.bold)
            ),
          ),

          const SizedBox(height: 24,),

          Text(
            'Fresh items everyday!',
            style: TextStyle(color: Colors.grey[600],
            fontFamily: 'boldfont', 
            fontSize: 20),
          ),

          const Spacer(),
          GestureDetector(
            onTap: () {
              notificationService.addNotification("Welcome to CropCart!");
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return SignUpScreen();
                }
              ));
            },
            child: Container(
              
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 126, 217, 87),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Get Started',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'boldfont',
                    fontSize: 18
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}