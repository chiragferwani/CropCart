import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/order.dart';
import 'package:grocery_shop_app/pages/orderdetails.dart';
import 'package:grocery_shop_app/pages/profit.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Admin Dashboard", style: TextStyle(fontFamily: 'boldfont')),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150,),
            // 🔹 Project Logo
            Center(
              child: Image.asset("assets/images/cropcart.png", height: 150),
            ),

            SizedBox(height: 10),

            // 🔹 Project Punchline
            Text(
              "Where Farms Meet Families!",
              style: TextStyle(fontSize: 16, fontFamily: 'boldfont', color: Colors.black54),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 30),

            // 🔹 Dashboard Tabs (Orders & Profits)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDashboardTile(
                  context,
                  title: "Orders",
                  icon: Icons.shopping_cart,
                  color: Colors.orange,
                  onTap: () {
                    // TODO: Navigate to Orders Page
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderDetails()),
                    );
                  },
                ),
                _buildDashboardTile(
                  context,
                  title: "Profits",
                  icon: Icons.attach_money,
                  color: Colors.blue,
                  onTap: () {
                    // TODO: Navigate to Profits Page
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfitScreen()),
                    );
                  },
                ),
                
              ],
            ),
            SizedBox(height: 20,),
            
          ],
        ),
      ),
    );
  }

  // 🔹 Dashboard Tile Widget
  Widget _buildDashboardTile(BuildContext context, {required String title, required IconData icon, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 18, fontFamily: 'boldfont', color: color)),
          ],
        ),
      ),
    );
  }
}
