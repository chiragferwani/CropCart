import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/components/grocery_item_tile.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';

class SolarPanelsScreen extends StatefulWidget {
  @override
  State<SolarPanelsScreen> createState() => _SolarPanelsScreenState();
}

class _SolarPanelsScreenState extends State<SolarPanelsScreen> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search for products.",
                  hintStyle: TextStyle(fontFamily: 'boldfont', color: Colors.black),
                  prefixIcon: const Icon(Icons.search, color: Colors.black,),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        searchText = "";
                      });
                    },
                    icon: const Icon(Icons.clear, color: Colors.black,),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
        child: Consumer<CartModel>(
          builder: (context, value, child) {
            // 1. Filter the *indices* of the items, not the items themselves:
            List<int> filteredIndices = [];
            for (int i = 0; i < value.shopItems.length; i++) {
              String itemName = value.shopItems[i][0].toString().toLowerCase();
              if (itemName.contains(searchText.toLowerCase())) {
                filteredIndices.add(i);
              }
            }

            return GridView.builder(
              itemCount: filteredIndices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                // 2. Use the filtered indices to access the original shopItems:
                int originalIndex = filteredIndices[index];

                return GroceryItemTile(
                  itemName: value.shopItems[originalIndex][0], // Access using originalIndex
                  itemPrice: value.shopItems[originalIndex][1],
                  imagePath: value.shopItems[originalIndex][2],
                  color: value.shopItems[originalIndex][3],
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                        .addItemToCart(originalIndex);
                  },
                );
              },
            );
          },
        ),
      ),
          ]
        )
      ),
    );
  }
}