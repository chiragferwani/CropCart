import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/navigation.dart';
import 'package:grocery_shop_app/pages/orderdetails.dart';
import 'package:lottie/lottie.dart';
import 'package:ionicons/ionicons.dart';
import 'notification_service.dart';
import 'loading.dart';
import 'maps.dart';


void someFunction() {
  notificationService.addNotification("Order Placed Successfully!");
}

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _ScoutScreenState();
}

class _ScoutScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     // backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            Center(
              child: Container(child: Lottie.asset('assets/images/order.json',
              height: 200,
              width: 200)),
            ),
            SizedBox(height: 100,),
            GestureDetector(
              onTap: (){
                notificationService.addNotification("Your Order Has been Placed!");
              },
              child: FloatingActionButton.extended(onPressed: (){
                someFunction();
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Navigation(),
                      ),
                    );
              }, 
              icon: Icon(Icons.shopping_cart_checkout_outlined, ), 
               label: Text("Order Placed!", style: TextStyle(fontFamily: 'boldfont', fontSize: 18),),
              backgroundColor: Colors.green,  
              foregroundColor: Colors.white,  
              ),
            )
          ],
        ),
        
      ),
      
    );
  }
}