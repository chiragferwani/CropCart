import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/intro_page.dart';
import 'package:grocery_shop_app/pages/navigation.dart';
import 'package:grocery_shop_app/pages/project.dart';
import 'package:grocery_shop_app/pages/splash.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:math';
import 'package:grocery_shop_app/main.dart';
import 'package:lottie/lottie.dart';
import 'maps.dart';

class Confirm extends StatefulWidget {
  const Confirm({super.key});

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyMap()
      ));
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
      title: Text("Order Confirmation", style: TextStyle(fontFamily: 'boldfont'),),
      backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      
    ),
       body: Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            Center(
              child: Container(child: Lottie.asset('assets/images/confirm.json',
              height: 200,
              width: 200)),
            ),
            SizedBox(height: 100,),
            FloatingActionButton.extended(onPressed: (){
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Navigation(),
                    ),
                  );
            }, 
            icon: Icon(Icons.shopping_cart_checkout_outlined, ), 
             label: Text("Order Confirmed!", style: TextStyle(fontFamily: 'boldfont', fontSize: 18),),
            backgroundColor: Colors.green,  
            foregroundColor: Colors.white,  
            )
          ],
        ),
        
      ),
    );
  }
}