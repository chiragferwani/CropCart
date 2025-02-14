import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ionicons/ionicons.dart';
import 'loading.dart';
import 'maps.dart';

class ScoutScreen extends StatefulWidget {
  const ScoutScreen({super.key});

  @override
  State<ScoutScreen> createState() => _ScoutScreenState();
}

class _ScoutScreenState extends State<ScoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     // backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Lottie.asset('assets/images/marketanimation.json'),
            SizedBox(height: 20,),
            FloatingActionButton.extended(onPressed: (){
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loading(),
                    ),
                  );
            }, 
            icon: Icon(Ionicons.compass_outline, ), 
             label: Text("Explore Markets", style: TextStyle(fontFamily: 'boldfont', fontSize: 18),),
            backgroundColor: Colors.green,  
            foregroundColor: Colors.white,  
            )
          ],
        ),
        
      ),
      
    );
  }
}