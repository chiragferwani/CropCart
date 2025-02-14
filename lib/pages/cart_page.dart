import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:grocery_shop_app/pages/order.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';
import 'notification_service.dart';
import 'package:grocery_shop_app/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  Future<void> showOrderNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'order_notifications',
      'Order Updates',
      channelDescription: 'Your order has been placed successfully!',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, 
      'Order Confirmed ✅', 
      'Your order has been placed successfully!',
      platformChannelSpecifics,
    );
  }

  // 🔹 Function to Calculate CropCoins (2% of Total Cart Value)
  double calculateCropCoins(double totalAmount) {
    return totalAmount * 0.02;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 AppBar with CropCoins Display

      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            value.cartItems[index][2],
                            height: 38,
                          ),
                          title: Text(
                            value.cartItems[index][0],
                            style: TextStyle(fontFamily: 'boldfont', color: Colors.black),
                          ),
                          subtitle: Text(
                            '\₹' + value.cartItems[index][1],
                            style: TextStyle(fontFamily: 'regfont', color: Colors.black),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Ionicons.close_circle, color: Color.fromARGB(255, 255, 121, 121)),
                            onPressed: () => Provider.of<CartModel>(context, listen: false).removeItemFromCart(index),
                          )
                        ),
                      ),
                    );
                  },
                ),
              ),

              // 🔹 Total Price + CropCoins Earned Section
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 126, 217, 87),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(color: Colors.black, fontFamily: 'boldfont', fontSize: 20),
                          ),
                          Text(
                            '\₹' + value.calculateTotal(),
                            style: TextStyle(color: Colors.black, fontFamily: 'boldfont', fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Earned CropCoins',
                            style: TextStyle(color: Colors.black, fontFamily: 'boldfont', fontSize: 18),
                          ),
                          Text(
                            '${calculateCropCoins(value.getTotalAmount()).toStringAsFixed(2)} Coins',
                            style: TextStyle(color: Colors.black, fontFamily: 'boldfont', fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // 🔹 Place Order Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    showOrderNotification();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Place Order',
                          style: TextStyle(color: Colors.black, fontFamily: 'boldfont', fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 24),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      )
    );
  }
}
