import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 100,
            ),
            Text(itemName, style: TextStyle(fontFamily: 'boldfont', color: Colors.black, fontSize: 16),),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to cart", style: TextStyle(color: Colors.black),)));
              },
              child: TextButton.icon(
              onPressed: onPressed, // Your function here
              onLongPress: () {
                // Show the Snackbar on long press
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Added to cart", style: TextStyle(color: Colors.black, fontFamily: 'boldfont', fontSize: 16)),
                  backgroundColor: Color.fromARGB(255, 126, 217, 87),
                ));
              },
               // Cart icon
              label: Text(
                '\₹$itemPrice',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'boldfont',
                  fontSize: 16
                ),
              ),
              icon: Icon(Icons.add_shopping_cart, color: Colors.white),
              style: TextButton.styleFrom(
                backgroundColor: color[800], // Button color
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjust padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              
            ),
            )

          ],
            // item name
            // price + button
        ),
      ),
    );
  }
}
