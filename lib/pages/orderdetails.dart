import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/confirm.dart';
import 'package:grocery_shop_app/pages/loading.dart';
import 'package:provider/provider.dart';
import 'notification_service.dart';
import 'package:grocery_shop_app/model/cart_model.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Details",
          style: TextStyle(fontFamily: 'boldfont'),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ordered Items",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'boldfont',
              ),
            ),
            SizedBox(height: 10),
            
            // Order Items List
            Expanded(
              child: ListView.builder(
                itemCount: cartModel.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartModel.cartItems[index];

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.asset(
                        item[2], // Image Path
                        height: 40,
                      ),
                      title: Text(
                        item[0], // Item Name
                        style: TextStyle(fontFamily: 'boldfont'),
                      ),
                      subtitle: Text(
                        '₹${item[1]}', // Price
                        style: TextStyle(fontFamily: 'regfont'),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Total Price
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "₹${cartModel.calculateTotal()}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              
            ),
            SizedBox(height: 50,),
              Center(
                child: FloatingActionButton.extended(onPressed: (){
                  notificationService.addNotification("Your Order is out for delivery!");
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Confirm(),
                      ),
                    );
                          }, 
                          icon: Icon(Icons.check, ), 
                           label: Text("Confirm Order", style: TextStyle(fontFamily: 'boldfont', fontSize: 18),),
                          backgroundColor: Colors.green,  
                          foregroundColor: Colors.white,  
                          ),
              ),
              SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
