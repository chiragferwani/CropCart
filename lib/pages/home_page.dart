import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/components/grocery_item_tile.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:grocery_shop_app/pages/cart_page.dart';
import 'package:grocery_shop_app/pages/cat.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Hello 👋',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'boldfont'
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Let\'s order fresh items for you',
                  style: TextStyle(
                    fontFamily: 'boldfont',
                    fontSize: 36,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Divider(),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Fresh items everyday',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'regfont',
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: GridView(
                    shrinkWrap: true,  // Ye GridView ko sirf jitni zaroorat ho utni height lega
                    physics: NeverScrollableScrollPhysics(), // Scroll disable, taaki parent hi scroll kare
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    children: [
                      CategoryTile(name: 'Vegetables', image: 'assets/images/cauli.png'),
                      CategoryTile(name: 'Fruits', image: 'assets/images/orange.png'),
                      CategoryTile(name: 'Pulses', image: 'assets/images/pulses.png'),
                      CategoryTile(name: 'Dairy', image: 'assets/images/dairy.png'),
                      CategoryTile(name: 'Herbs', image: 'assets/images/herbs.png'),
                      CategoryTile(name: 'Nuts', image: 'assets/images/nuts.png'),
                      CategoryTile(name: 'Organic', image: 'assets/images/organic.png'),
                      CategoryTile(name: 'Processed', image: 'assets/images/processed.png'),
                    ],
                  ),
                ),
              ),




              //fresh items + grid
            ],
          ),
        ),
      ),
    );
  }
}



class CategoryTile extends StatelessWidget {
  final String name;
  final String image;

  const CategoryTile({required this.name, required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white, // Common white background
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 140, // Image size
            child: Image.asset(image, fit: BoxFit.contain),
            
          ),
          SizedBox(height: 20),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'boldfont'),
          ),
        ],
      ),
    );
  }
}

