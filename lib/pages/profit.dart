import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grocery_shop_app/model/cart_model.dart';

class ProfitScreen extends StatelessWidget {
  const ProfitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context, listen: false);
    
    double totalProfit = _calculateTotalProfit(cartModel);
    double deliveryCost = 20; // Fixed ₹20 for 0-5km
    double netProfit = _calculateNetProfit(totalProfit, deliveryCost);

    return Scaffold(
      appBar: AppBar(
        title: Text("Profit Breakdown", style: TextStyle(fontFamily: 'boldfont')),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profit Per Item",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'boldfont'),
            ),
            SizedBox(height: 10),

            // Item-wise Profit List
            Expanded(
              child: ListView.builder(
                itemCount: cartModel.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartModel.cartItems[index];
                  double itemProfit = _calculateItemProfit(item);

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.asset(item[2], height: 40),
                      title: Text(item[0], style: TextStyle(fontFamily: 'boldfont')),
                      subtitle: Text('Profit: ₹${itemProfit.toStringAsFixed(2)}',
                          style: TextStyle(fontFamily: 'boldfont', color: Colors.green)),
                    ),
                  );
                },
              ),
            ),

            // 🔹 Profit Summary
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildSummaryRow("Total Profit Before Discounts", "₹${totalProfit.toStringAsFixed(2)}"),
                  _buildSummaryRow("Delivery Cost", "± ₹${deliveryCost.toStringAsFixed(2)}"),
                  _buildSummaryRow("Farmer's Growth Fund (2%)", "- ₹${(totalProfit * 0.02).toStringAsFixed(2)}"),
                  _buildSummaryRow("Cart Coins Discount (2%)", "- ₹${(totalProfit * 0.02).toStringAsFixed(2)}"),
                  Divider(),
                  _buildSummaryRow("Net Profit", "₹${netProfit.toStringAsFixed(2)}", isBold: true, isGreen: true),
                ],
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }

  // 🔹 Function to Calculate Profit Per Item
  double _calculateItemProfit(List item) {
    double itemPrice = double.parse(item[1]);
    return itemPrice * 0.09; // 9% Profit per item
  }

  // 🔹 Function to Calculate Total Profit (Before Discounts)
  double _calculateTotalProfit(CartModel cartModel) {
    double totalProfit = 0;
    for (var item in cartModel.cartItems) {
      totalProfit += _calculateItemProfit(item);
    }
    return totalProfit;
  }

  // 🔹 Function to Calculate Net Profit After Discounts
  double _calculateNetProfit(double totalProfit, double deliveryCost) {
    double farmersGrowthFund = totalProfit * 0.02; // 2% Deduction
    double cartCoinsDiscount = totalProfit * 0.02; // 2% Deduction
    return totalProfit - (farmersGrowthFund + cartCoinsDiscount);
  }

  // 🔹 Helper Function to Display Rows
  Widget _buildSummaryRow(String label, String value, {bool isBold = false, bool isGreen = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontFamily: 'boldfont')),
          Text(value, style: TextStyle(
              fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontFamily: 'boldfont',
              color: isGreen ? Colors.green : Colors.black)),
        ],
      ),
    );
  }
}
