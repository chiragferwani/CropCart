import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    // itemName, itemPrice, imagePath, color
    ['Tomato', '25.00', 'assets/images/tomato.png', Colors.red],
    ['Potato', '35.00', 'assets/images/potato.png', Colors.yellow],
    ['Onion', '39.00', 'assets/images/onion.png', Colors.pink],
    ['Capsicum', '27.00', 'assets/images/shimla.png', Colors.green],
    ['Apple', '160.00', 'assets/images/apple.png', Colors.red],
    ['Banana', '52.00', 'assets/images/banana.png', Colors.yellow],
    ['Mango', '279.00', 'assets/images/mango.png', Colors.brown],
    ['Grapes', '65.00', 'assets/images/grapes.png', Colors.green],
    ['Ladyfinger', '32.00', 'assets/images/lady.png', Colors.green],
    ['Cauliflower', '23.00', 'assets/images/cauli.png', Colors.lightGreen],
    ['Ginger', '15.00', 'assets/images/ginger.png', Colors.grey],
    ['Garlic', '82.00', 'assets/images/garlic.png', Colors.lightBlue],
    ['Brocolli', '25.00', 'assets/images/broc.png', Colors.lightGreen],
    ['Carrot', '65.00', 'assets/images/carrot.png', Colors.orange],
    ['Strawberry', '45.00', 'assets/images/straw.png', Colors.pink],
    ['Watermelon', '62.00', 'assets/images/water.png', Colors.red],
    ['Papaya', '57.00', 'assets/images/papaya.png', Colors.yellow],
    ['Orange', '79.00', 'assets/images/orange.png', Colors.orange],
  ];

  final List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  // add to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  double getTotalAmount() {
  double total = 0;
  for (var item in _cartItems) {
    total += double.parse(item[1]); // Item price (String to Double convert)
  }
  return total;
}

  // remove
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // total price
  String calculateTotal() {
    double total = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      total += double.parse(_cartItems[i][1]);
    }

    return total.toStringAsFixed(2);
  }
}